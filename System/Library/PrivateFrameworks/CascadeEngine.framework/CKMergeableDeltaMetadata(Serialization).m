@interface CKMergeableDeltaMetadata(Serialization)
+ (id)decodeMergeableDeltaMetadata:()Serialization withError:;
+ (id)encodeMergeableDeltaMetadata:()Serialization withError:;
@end

@implementation CKMergeableDeltaMetadata(Serialization)

+ (id)encodeMergeableDeltaMetadata:()Serialization withError:
{
  id v10 = 0;
  v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v10];
  id v6 = v10;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x263EFF8F8] data];
  }
  v8 = v7;

  if (a4 && v6) {
    *a4 = v6;
  }

  return v8;
}

+ (id)decodeMergeableDeltaMetadata:()Serialization withError:
{
  v5 = (void *)MEMORY[0x263F08928];
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a3;
  v8 = objc_msgSend(v6, "setWithObjects:", objc_opt_class(), 0);
  id v12 = 0;
  v9 = [v5 unarchivedObjectOfClasses:v8 fromData:v7 error:&v12];

  id v10 = v12;
  if (a4 && v10) {
    *a4 = v10;
  }

  return v9;
}

@end