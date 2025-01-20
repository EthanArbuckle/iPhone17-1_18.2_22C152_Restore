@interface HMFaceCrop(HMI)
- (id)createHMIFaceCrop;
- (uint64_t)initWithHMIFaceCrop:()HMI;
@end

@implementation HMFaceCrop(HMI)

- (id)createHMIFaceCrop
{
  id v2 = objc_alloc(MEMORY[0x1E4F697E8]);
  v3 = [a1 UUID];
  v4 = [a1 dataRepresentation];
  v5 = [a1 dateCreated];
  [a1 faceBoundingBox];
  v6 = objc_msgSend(v2, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v3, v4, v5);

  return v6;
}

- (uint64_t)initWithHMIFaceCrop:()HMI
{
  id v4 = a3;
  v5 = [v4 UUID];
  v6 = [v4 dataRepresentation];
  v7 = [v4 dateCreated];
  [v4 faceBoundingBox];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  uint64_t v16 = objc_msgSend(a1, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v5, v6, v7, v9, v11, v13, v15);
  return v16;
}

@end