@interface CLCircularRegion(HMFObject)
- (id)attributeDescriptions;
- (id)description;
@end

@implementation CLCircularRegion(HMFObject)

- (id)attributeDescriptions
{
  v18[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F65538] defaultFormatter];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = NSNumber;
  [a1 center];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)[v3 initWithName:@"Lat" value:v5 options:0 formatter:v2];
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = NSNumber;
  objc_msgSend(a1, "center", v6);
  v10 = [v8 numberWithDouble:v9];
  v11 = (void *)[v7 initWithName:@"Long" value:v10 options:0 formatter:v2];
  v18[1] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = NSNumber;
  [a1 radius];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  v15 = (void *)[v12 initWithName:@"R" value:v14 options:0 formatter:v2];
  v18[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];

  return v16;
}

- (id)description
{
  v3.receiver = a1;
  v3.super_class = (Class)&off_1F2EDD348;
  v1 = objc_msgSendSuper2(&v3, sel_description);
  return v1;
}

@end