@interface MOWebContentFilterPolicySettingMetadata
- (MOWebContentFilterPolicy)defaultValue;
- (MOWebContentFilterPolicySettingMetadata)initWithSettingName:(id)a3 defaultPolicy:(id)a4 maximumAutoAllowCount:(unint64_t)a5 maximumNeverAllowCount:(unint64_t)a6 maximumOnlyAllowCount:(unint64_t)a7 isPublic:(BOOL)a8 scope:(id)a9 isPrivacySensitive:(BOOL)a10;
- (id)_combine:(id)a3 with:(id)a4;
- (id)combinePersistableValue:(id)a3 with:(id)a4;
- (id)persistableValueFromValue:(id)a3;
- (id)sanitizePersistableValue:(id)a3;
- (id)valueFromPersistableValue:(id)a3;
- (unint64_t)maximumAutoAllowCount;
- (unint64_t)maximumNeverAllowCount;
- (unint64_t)maximumOnlyAllowCount;
@end

@implementation MOWebContentFilterPolicySettingMetadata

- (MOWebContentFilterPolicySettingMetadata)initWithSettingName:(id)a3 defaultPolicy:(id)a4 maximumAutoAllowCount:(unint64_t)a5 maximumNeverAllowCount:(unint64_t)a6 maximumOnlyAllowCount:(unint64_t)a7 isPublic:(BOOL)a8 scope:(id)a9 isPrivacySensitive:(BOOL)a10
{
  v14.receiver = self;
  v14.super_class = (Class)MOWebContentFilterPolicySettingMetadata;
  result = [(MOSettingMetadata *)&v14 initWithSettingName:a3 defaultValue:a4 isPublic:a8 scope:a9 isPrivacySensitive:a10];
  result->_maximumNeverAllowCount = a6;
  result->_maximumAutoAllowCount = a5;
  result->_maximumOnlyAllowCount = a7;
  return result;
}

- (MOWebContentFilterPolicy)defaultValue
{
  v4.receiver = self;
  v4.super_class = (Class)MOWebContentFilterPolicySettingMetadata;
  v2 = [(MOSettingMetadata *)&v4 defaultValue];
  return (MOWebContentFilterPolicy *)v2;
}

- (id)persistableValueFromValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v4 = [v3 persistableValue];
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (id)valueFromPersistableValue:(id)a3
{
  return +[MOWebContentFilterPolicy initializeWithPersistableValue:a3];
}

- (id)sanitizePersistableValue:(id)a3
{
  id v4 = a3;
  if (+[MOWebContentFilterPolicy isValidPersistableRepresentation:v4])
  {
    v5 = +[MOWebContentFilterPolicy initializeWithPersistableValue:v4];
    v6 = [v5 autoAllow];
    if ([v6 count] <= self->_maximumAutoAllowCount)
    {
      v7 = [v5 neverAllow];
      if ([v7 count] <= self->_maximumNeverAllowCount)
      {
        v10 = [v5 onlyAllow];
        unint64_t v11 = [v10 count];
        unint64_t maximumOnlyAllowCount = self->_maximumOnlyAllowCount;

        if (v11 <= maximumOnlyAllowCount)
        {
          id v8 = v4;
          goto LABEL_7;
        }
LABEL_6:
        id v8 = 0;
LABEL_7:

        goto LABEL_9;
      }
    }
    goto LABEL_6;
  }
  id v8 = 0;
LABEL_9:

  return v8;
}

- (id)combinePersistableValue:(id)a3 with:(id)a4
{
  id v6 = a4;
  v7 = [(MOWebContentFilterPolicySettingMetadata *)self sanitizePersistableValue:a3];
  id v8 = [(MOWebContentFilterPolicySettingMetadata *)self sanitizePersistableValue:v6];

  if (v7)
  {
    if (v8)
    {
      v9 = +[MOWebContentFilterPolicy initializeWithPersistableValue:v7];
      v10 = +[MOWebContentFilterPolicy initializeWithPersistableValue:v8];
      unint64_t v11 = [(MOWebContentFilterPolicySettingMetadata *)self _combine:v9 with:v10];
      v12 = [v11 persistableValue];

      goto LABEL_9;
    }
    id v13 = v7;
    goto LABEL_7;
  }
  if (v8)
  {
    id v13 = v8;
LABEL_7:
    v12 = v13;
    goto LABEL_9;
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (id)_combine:(id)a3 with:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  switch([v5 policy])
  {
    case 0:
      v7 = (MOWebContentFilterPolicy *)v6;
      goto LABEL_11;
    case 1:
      switch([v6 policy])
      {
        case 0:
          goto LABEL_10;
        case 1:
          id v8 = [v5 neverAllow];
          v9 = [v6 neverAllow];
          v10 = [v8 setByAddingObjectsFromSet:v9];

          unint64_t v11 = [[MOWebContentFilterPolicy alloc] initWithAutoAllow:0 neverAllow:v10 onlyAllow:0];
          goto LABEL_22;
        case 2:
          v27 = (void *)MEMORY[0x1E4F1CA80];
          v28 = [v6 autoAllow];
          v29 = [v27 setWithSet:v28];

          v30 = [v5 neverAllow];
          v31 = [v6 neverAllow];
          v32 = [v30 setByAddingObjectsFromSet:v31];

          [v29 minusSet:v32];
          v33 = [MOWebContentFilterPolicy alloc];
          v34 = (void *)[v29 copy];
          unint64_t v11 = [(MOWebContentFilterPolicy *)v33 initWithAutoAllow:v34 neverAllow:v32 onlyAllow:0];

          goto LABEL_18;
        case 3:
          goto LABEL_13;
        default:
          goto LABEL_12;
      }
    case 2:
      switch([v6 policy])
      {
        case 0:
          goto LABEL_10;
        case 1:
          v12 = [v5 neverAllow];
          id v13 = [v6 neverAllow];
          v10 = [v12 setByAddingObjectsFromSet:v13];

          objc_super v14 = [MOWebContentFilterPolicy alloc];
          v15 = [v5 autoAllow];
          v16 = v14;
          v17 = v15;
          v18 = v10;
          v19 = 0;
          goto LABEL_21;
        case 2:
          v35 = (void *)MEMORY[0x1E4F1CA80];
          v36 = [v5 autoAllow];
          v29 = [v35 setWithSet:v36];

          v37 = [v5 neverAllow];
          v38 = [v6 neverAllow];
          v39 = [v37 setByAddingObjectsFromSet:v38];

          v40 = [v6 autoAllow];
          [v29 intersectSet:v40];

          [v29 minusSet:v39];
          v41 = [MOWebContentFilterPolicy alloc];
          v42 = (void *)[v29 copy];
          unint64_t v11 = [(MOWebContentFilterPolicy *)v41 initWithAutoAllow:v42 neverAllow:v39 onlyAllow:0];

LABEL_18:
          break;
        case 3:
LABEL_13:
          v21 = (void *)MEMORY[0x1E4F1CA80];
          v22 = [v6 onlyAllow];
          v10 = [v21 setWithSet:v22];

          v23 = v5;
          goto LABEL_15;
        default:
          goto LABEL_12;
      }
      goto LABEL_23;
    case 3:
      uint64_t v20 = [v6 policy];
      if ((unint64_t)(v20 - 1) < 2)
      {
        v24 = (void *)MEMORY[0x1E4F1CA80];
        v25 = [v5 onlyAllow];
        v10 = [v24 setWithSet:v25];

        v23 = v6;
LABEL_15:
        v26 = [v23 neverAllow];
        [v10 minusSet:v26];
LABEL_20:

        v45 = [MOWebContentFilterPolicy alloc];
        v15 = (void *)[v10 copy];
        v16 = v45;
        v17 = 0;
        v18 = 0;
        v19 = v15;
LABEL_21:
        unint64_t v11 = [(MOWebContentFilterPolicy *)v16 initWithAutoAllow:v17 neverAllow:v18 onlyAllow:v19];

LABEL_22:
        goto LABEL_23;
      }
      if (v20 == 3)
      {
        v43 = (void *)MEMORY[0x1E4F1CA80];
        v44 = [v5 onlyAllow];
        v10 = [v43 setWithSet:v44];

        v26 = [v6 onlyAllow];
        [v10 intersectSet:v26];
        goto LABEL_20;
      }
      if (v20)
      {
LABEL_12:
        unint64_t v11 = 0;
      }
      else
      {
LABEL_10:
        v7 = (MOWebContentFilterPolicy *)v5;
LABEL_11:
        unint64_t v11 = v7;
      }
LABEL_23:

      return v11;
    default:
      goto LABEL_12;
  }
}

- (unint64_t)maximumAutoAllowCount
{
  return self->_maximumAutoAllowCount;
}

- (unint64_t)maximumNeverAllowCount
{
  return self->_maximumNeverAllowCount;
}

- (unint64_t)maximumOnlyAllowCount
{
  return self->_maximumOnlyAllowCount;
}

@end