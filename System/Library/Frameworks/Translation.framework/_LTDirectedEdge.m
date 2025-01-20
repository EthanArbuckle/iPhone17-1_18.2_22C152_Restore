@interface _LTDirectedEdge
+ (BOOL)supportsSecureCoding;
+ (id)genderEdgeWithTargetPhraseIndex:(unint64_t)a3 targetPreview:(id)a4 gender:(unint64_t)a5 defaultGender:(unint64_t)a6;
+ (id)meaningEdgeWithTargetPhraseIndex:(unint64_t)a3 targetPreview:(id)a4 meaningDescription:(id)a5 targetGender:(id)a6 defaultGender:(id)a7;
- (BOOL)isEqual:(id)a3;
- (NSNumber)defaultGender;
- (NSNumber)targetGender;
- (NSString)menuDescription;
- (NSString)targetPreview;
- (_LTDirectedEdge)initWithCoder:(id)a3;
- (id)_initWithTargetPhraseIndex:(unint64_t)a3 type:(unint64_t)a4 targetPreview:(id)a5 targetGender:(id)a6 defaultGender:(id)a7 menuDescription:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unint64_t)targetPhraseIndex;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LTDirectedEdge

+ (id)meaningEdgeWithTargetPhraseIndex:(unint64_t)a3 targetPreview:(id)a4 meaningDescription:(id)a5 targetGender:(id)a6 defaultGender:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = (void *)[objc_alloc((Class)a1) _initWithTargetPhraseIndex:a3 type:0 targetPreview:v15 targetGender:v13 defaultGender:v12 menuDescription:v14];

  return v16;
}

+ (id)genderEdgeWithTargetPhraseIndex:(unint64_t)a3 targetPreview:(id)a4 gender:(unint64_t)a5 defaultGender:(unint64_t)a6
{
  id v10 = a4;
  id v11 = objc_alloc((Class)a1);
  id v12 = [NSNumber numberWithUnsignedInteger:a5];
  id v13 = [NSNumber numberWithUnsignedInteger:a6];
  id v14 = menuDescriptionForGender(a5);
  id v15 = (void *)[v11 _initWithTargetPhraseIndex:a3 type:1 targetPreview:v10 targetGender:v12 defaultGender:v13 menuDescription:v14];

  return v15;
}

- (id)_initWithTargetPhraseIndex:(unint64_t)a3 type:(unint64_t)a4 targetPreview:(id)a5 targetGender:(id)a6 defaultGender:(id)a7 menuDescription:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)_LTDirectedEdge;
  v18 = [(_LTDirectedEdge *)&v26 init];
  v19 = v18;
  if (v18)
  {
    v18->_targetPhraseIndex = a3;
    v18->_type = a4;
    uint64_t v20 = [v14 copy];
    targetPreview = v19->_targetPreview;
    v19->_targetPreview = (NSString *)v20;

    objc_storeStrong((id *)&v19->_targetGender, a6);
    objc_storeStrong((id *)&v19->_defaultGender, a7);
    uint64_t v22 = [v17 copy];
    menuDescription = v19->_menuDescription;
    v19->_menuDescription = (NSString *)v22;

    v24 = v19;
  }

  return v19;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(_LTDirectedEdge *)self type];
  uint64_t v6 = [v4 type];
  if (v5 != v6)
  {
    unint64_t v11 = v6;
    id v12 = NSNumber;
    sortOrderForType(v5);
    v7 = [v12 numberWithUnsignedInteger:v5];
    id v13 = NSNumber;
    sortOrderForType(v11);
LABEL_7:
    id v10 = v13;
    uint64_t v9 = v11;
    goto LABEL_8;
  }
  if (v5 == 1)
  {
    id v14 = [(_LTDirectedEdge *)self targetGender];
    unint64_t v15 = [v14 unsignedIntegerValue];

    id v16 = [v4 targetGender];
    unint64_t v11 = [v16 unsignedIntegerValue];

    id v17 = NSNumber;
    sortOrderForGender(v15);
    v7 = [v17 numberWithUnsignedInteger:v15];
    id v13 = NSNumber;
    sortOrderForGender(v11);
    goto LABEL_7;
  }
  if (v5)
  {
    unexpectedDisambiguationTypeException(v5);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_LTDirectedEdge targetPhraseIndex](self, "targetPhraseIndex"));
  v8 = NSNumber;
  uint64_t v9 = [v4 targetPhraseIndex];
  id v10 = v8;
LABEL_8:
  v18 = [v10 numberWithUnsignedInteger:v9];
  int64_t v19 = [v7 compare:v18];

  return v19;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = _LTDisambiguationTypeDescription([(_LTDirectedEdge *)self type]);
  unint64_t v7 = [(_LTDirectedEdge *)self targetPhraseIndex];
  v8 = [(_LTDirectedEdge *)self targetPreview];
  uint64_t v9 = [(_LTDirectedEdge *)self menuDescription];
  id v10 = [(_LTDirectedEdge *)self defaultGender];
  unint64_t v11 = v10;
  if (v10)
  {
    menuDescriptionForGender([v10 unsignedIntegerValue]);
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = @"n/a";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; type: %@; targetIndex: %zu; preview: %@; menuDescription: %@; defaultGender: %@>",
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
  id v13 = v12);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(_LTDirectedEdge *)self type];
    if (v6 == [v5 type]
      && (unint64_t v7 = [(_LTDirectedEdge *)self targetPhraseIndex],
          v7 == [v5 targetPhraseIndex]))
    {
      v8 = [(_LTDirectedEdge *)self targetPreview];
      uint64_t v9 = [v5 targetPreview];
      if ([v8 isEqualToString:v9])
      {
        id v10 = [(_LTDirectedEdge *)self menuDescription];
        unint64_t v11 = [v5 menuDescription];
        if ([v10 isEqualToString:v11])
        {
          id v12 = [(_LTDirectedEdge *)self targetGender];
          id v13 = [v5 targetGender];
          if (_LTIsEqual(v12, v13))
          {
            id v17 = [(_LTDirectedEdge *)self defaultGender];
            id v14 = [v5 defaultGender];
            char v15 = _LTIsEqual(v17, v14);
          }
          else
          {
            char v15 = 0;
          }
        }
        else
        {
          char v15 = 0;
        }
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_LTDirectedEdge type](self, "type"));
  uint64_t v4 = [v3 hash];
  id v5 = [(_LTDirectedEdge *)self targetPreview];
  uint64_t v6 = [v5 hash];
  unint64_t v7 = [(_LTDirectedEdge *)self menuDescription];
  uint64_t v8 = v6 ^ [v7 hash];
  uint64_t v9 = [(_LTDirectedEdge *)self targetGender];
  uint64_t v10 = v8 ^ [v9 hash];
  unint64_t v11 = [(_LTDirectedEdge *)self defaultGender];
  unint64_t v12 = v10 ^ [v11 hash] ^ v4;

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t targetPhraseIndex = self->_targetPhraseIndex;
  id v5 = a3;
  [v5 encodeInteger:targetPhraseIndex forKey:@"targetPhraseIndex"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeObject:self->_targetPreview forKey:@"targetPreview"];
  [v5 encodeObject:self->_targetGender forKey:@"targetGender"];
  [v5 encodeObject:self->_defaultGender forKey:@"defaultGender"];
  [v5 encodeObject:self->_menuDescription forKey:@"menuDescription"];
}

- (_LTDirectedEdge)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_LTDirectedEdge;
  id v5 = [(_LTDirectedEdge *)&v16 init];
  if (v5)
  {
    v5->_unint64_t targetPhraseIndex = [v4 decodeIntegerForKey:@"targetPhraseIndex"];
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetPreview"];
    targetPreview = v5->_targetPreview;
    v5->_targetPreview = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetGender"];
    targetGender = v5->_targetGender;
    v5->_targetGender = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultGender"];
    defaultGender = v5->_defaultGender;
    v5->_defaultGender = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"menuDescription"];
    menuDescription = v5->_menuDescription;
    v5->_menuDescription = (NSString *)v12;

    id v14 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t targetPhraseIndex = self->_targetPhraseIndex;
  unint64_t type = self->_type;
  unint64_t v7 = (void *)[(NSString *)self->_targetPreview copy];
  uint64_t v8 = (void *)[(NSNumber *)self->_targetGender copy];
  uint64_t v9 = (void *)[(NSNumber *)self->_defaultGender copy];
  uint64_t v10 = (void *)[(NSString *)self->_menuDescription copy];
  unint64_t v11 = (void *)[v4 _initWithTargetPhraseIndex:targetPhraseIndex type:type targetPreview:v7 targetGender:v8 defaultGender:v9 menuDescription:v10];

  return v11;
}

- (unint64_t)targetPhraseIndex
{
  return self->_targetPhraseIndex;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)targetPreview
{
  return self->_targetPreview;
}

- (NSNumber)targetGender
{
  return self->_targetGender;
}

- (NSNumber)defaultGender
{
  return self->_defaultGender;
}

- (NSString)menuDescription
{
  return self->_menuDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuDescription, 0);
  objc_storeStrong((id *)&self->_defaultGender, 0);
  objc_storeStrong((id *)&self->_targetGender, 0);

  objc_storeStrong((id *)&self->_targetPreview, 0);
}

@end