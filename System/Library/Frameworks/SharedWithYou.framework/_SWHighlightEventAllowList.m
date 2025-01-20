@interface _SWHighlightEventAllowList
+ (Class)eventClassForType:(int64_t)a3;
+ (id)_eventClassToTypeMap;
+ (id)allowedClasses;
+ (int64_t)eventTypeForClass:(Class)a3;
@end

@implementation _SWHighlightEventAllowList

+ (id)_eventClassToTypeMap
{
  v13[8] = *MEMORY[0x1E4F143B8];
  v2 = self;
  v12[0] = v2;
  v13[0] = &unk_1EDF1E6C0;
  v3 = self;
  v12[1] = v3;
  v13[1] = &unk_1EDF1E6D8;
  v4 = self;
  v12[2] = v4;
  v13[2] = &unk_1EDF1E6F0;
  v5 = self;
  v12[3] = v5;
  v13[3] = &unk_1EDF1E708;
  v6 = self;
  v12[4] = v6;
  v13[4] = &unk_1EDF1E6C0;
  v7 = self;
  v12[5] = v7;
  v13[5] = &unk_1EDF1E6D8;
  v8 = self;
  v12[6] = v8;
  v13[6] = &unk_1EDF1E6F0;
  v9 = self;
  v12[7] = v9;
  v13[7] = &unk_1EDF1E708;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:8];

  return v10;
}

+ (id)allowedClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [a1 _eventClassToTypeMap];
  v4 = [v3 allKeys];
  v5 = [v2 setWithArray:v4];

  return v5;
}

+ (Class)eventClassForType:(int64_t)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  uint64_t v11 = 0;
  v4 = [a1 _eventClassToTypeMap];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48___SWHighlightEventAllowList_eventClassForType___block_invoke;
  v7[3] = &unk_1E5665D58;
  v7[4] = &v8;
  v7[5] = a3;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  id v5 = (id)v9[3];
  _Block_object_dispose(&v8, 8);

  return (Class)v5;
}

+ (int64_t)eventTypeForClass:(Class)a3
{
  v4 = [a1 _eventClassToTypeMap];
  uint64_t v5 = [v4 objectForKey:a3];
  v6 = (void *)v5;
  v7 = &unk_1EDF1E720;
  if (v5) {
    v7 = (void *)v5;
  }
  id v8 = v7;

  int64_t v9 = [v8 integerValue];
  return v9;
}

@end