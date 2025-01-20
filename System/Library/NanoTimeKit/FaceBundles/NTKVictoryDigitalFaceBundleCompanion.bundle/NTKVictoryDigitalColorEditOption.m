@interface NTKVictoryDigitalColorEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)domain;
+ (id)pigmentFaceDomain;
- (BOOL)optionExistsInDevice:(id)a3;
@end

@implementation NTKVictoryDigitalColorEditOption

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_17428);
  id WeakRetained = objc_loadWeakRetained(&qword_17430);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_17430);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&qword_17430, v4);
    qword_17438 = (uint64_t)[v4 version];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_710C;
    v13[3] = &unk_104D8;
    v13[4] = a1;
    sub_710C((uint64_t)v13, (uint64_t)v4);
    goto LABEL_6;
  }
  id v8 = [v4 version];
  uint64_t v9 = qword_17438;

  if (v8 != (id)v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_17428);
  id v11 = (id)qword_17420;

  return v11;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
  if ([v4 supportsCapability:v5])
  {
    char v6 = 1;
  }
  else
  {
    id v7 = _NTKNewToGraceEVictoryColors();
    unsigned __int8 v8 = objc_msgSend(v7, "containsIndex:", -[NTKVictoryDigitalColorEditOption victoryColor](self, "victoryColor"));

    char v6 = v8 ^ 1;
  }

  return v6;
}

+ (id)pigmentFaceDomain
{
  return [a1 domain];
}

+ (id)domain
{
  return @"victoryDigital";
}

@end