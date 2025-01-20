@interface HMPersonFaceCrop(HMI)
- (id)createHMIPersonFaceCrop;
- (uint64_t)initWithHMIPersonFaceCrop:()HMI;
@end

@implementation HMPersonFaceCrop(HMI)

- (id)createHMIPersonFaceCrop
{
  id v2 = objc_alloc(MEMORY[0x1E4F69820]);
  v3 = [a1 UUID];
  v4 = [a1 dataRepresentation];
  v5 = [a1 dateCreated];
  [a1 faceBoundingBox];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [a1 personUUID];
  v15 = objc_msgSend(v2, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v3, v4, v5, v14, v7, v9, v11, v13);

  return v15;
}

- (uint64_t)initWithHMIPersonFaceCrop:()HMI
{
  id v4 = a3;
  v5 = [v4 UUID];
  double v6 = [v4 dataRepresentation];
  double v7 = [v4 dateCreated];
  [v4 faceBoundingBox];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [v4 personUUID];

  uint64_t v17 = objc_msgSend(a1, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v5, v6, v7, v16, v9, v11, v13, v15);
  return v17;
}

@end