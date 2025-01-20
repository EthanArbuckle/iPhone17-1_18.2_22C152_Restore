@interface NTKVictoryAnalogColorEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)domain;
+ (id)pigmentFaceDomain;
- (BOOL)optionExistsInDevice:(id)a3;
@end

@implementation NTKVictoryAnalogColorEditOption

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_12B00);
  id WeakRetained = objc_loadWeakRetained(&qword_12B08);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_12B08);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&qword_12B08, v4);
    qword_12B10 = (uint64_t)[v4 version];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_2EB0;
    v13[3] = &unk_C3A0;
    v13[4] = a1;
    sub_2EB0((uint64_t)v13, (uint64_t)v4);
    goto LABEL_6;
  }
  id v8 = [v4 version];
  uint64_t v9 = qword_12B10;

  if (v8 != (id)v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_12B00);
  id v11 = (id)qword_12AF8;

  return v11;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D0D02931-2190-4E71-B843-C73C4ADB3F27"];
  if ([v4 supportsCapability:v5] && !NTKGizmoOrCompanionAreRussian())
  {
  }
  else
  {
    v6 = (char *)[(NTKVictoryAnalogColorEditOption *)self victoryColor];

    if (v6 == (unsigned char *)&dword_1C + 2)
    {
      char v7 = 0;
      goto LABEL_9;
    }
  }
  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
  if ([v4 supportsCapability:v8])
  {

    char v7 = 1;
  }
  else
  {
    uint64_t v9 = _NTKNewToGraceEVictoryColors();
    unsigned __int8 v10 = objc_msgSend(v9, "containsIndex:", -[NTKVictoryAnalogColorEditOption victoryColor](self, "victoryColor"));

    char v7 = v10 ^ 1;
  }
LABEL_9:

  return v7;
}

+ (id)pigmentFaceDomain
{
  return [a1 domain];
}

+ (id)domain
{
  return @"victoryAnalog";
}

@end