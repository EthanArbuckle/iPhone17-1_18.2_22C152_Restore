@interface HMDCoreDataCloudTransformDevice
+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5;
+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
@end

@implementation HMDCoreDataCloudTransformDevice

+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return 1;
}

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  v6 = objc_msgSend(a6, "objectWithID:", a3, a4, a5);
  v7 = [v6 resident];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 name];
    v10 = [v6 name];
    char v11 = HMFEqualObjects();

    if ((v11 & 1) == 0)
    {
      v12 = [v6 name];
      [v8 setName:v12];
    }
  }

  return 1;
}

+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  v8 = (void *)MEMORY[0x263EFFA08];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 set];
  LOBYTE(a1) = [a1 exportUpdateWithObjectID:v11 updatedProperties:v12 additionalUpdates:v10 context:v9];

  return (char)a1;
}

@end