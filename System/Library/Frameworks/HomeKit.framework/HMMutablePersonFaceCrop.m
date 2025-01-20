@interface HMMutablePersonFaceCrop
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HMMutablePersonFaceCrop

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMPersonFaceCrop allocWithZone:a3];
  v5 = [(HMFaceCrop *)self UUID];
  v6 = [(HMFaceCrop *)self dataRepresentation];
  v7 = [(HMFaceCrop *)self dateCreated];
  [(HMFaceCrop *)self faceBoundingBox];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(HMPersonFaceCrop *)self personUUID];
  v17 = -[HMPersonFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:](v4, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v5, v6, v7, v16, v9, v11, v13, v15);

  v18 = [(HMPersonFaceCrop *)self unassociatedFaceCropUUID];
  [(HMPersonFaceCrop *)v17 setUnassociatedFaceCropUUID:v18];

  [(HMPersonFaceCrop *)v17 setSource:[(HMPersonFaceCrop *)self source]];
  return v17;
}

@end