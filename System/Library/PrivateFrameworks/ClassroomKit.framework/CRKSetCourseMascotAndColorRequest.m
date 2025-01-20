@interface CRKSetCourseMascotAndColorRequest
+ (BOOL)supportsSecureCoding;
- (CRKSetCourseMascotAndColorRequest)initWithCoder:(id)a3;
- (DMFControlGroupIdentifier)courseIdentifier;
- (unint64_t)colorType;
- (unint64_t)mascotType;
- (void)encodeWithCoder:(id)a3;
- (void)setColorType:(unint64_t)a3;
- (void)setCourseIdentifier:(id)a3;
- (void)setMascotType:(unint64_t)a3;
@end

@implementation CRKSetCourseMascotAndColorRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSetCourseMascotAndColorRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRKSetCourseMascotAndColorRequest;
  v5 = [(CATTaskRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"courseIdentifier"];
    courseIdentifier = v5->_courseIdentifier;
    v5->_courseIdentifier = (DMFControlGroupIdentifier *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mascotType"];
    v5->_mascotType = [v9 unsignedIntegerValue];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colorType"];
    v5->_colorType = [v10 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CRKSetCourseMascotAndColorRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v8 encodeWithCoder:v4];
  v5 = [(CRKSetCourseMascotAndColorRequest *)self courseIdentifier];
  [v4 encodeObject:v5 forKey:@"courseIdentifier"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKSetCourseMascotAndColorRequest mascotType](self, "mascotType"));
  [v4 encodeObject:v6 forKey:@"mascotType"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKSetCourseMascotAndColorRequest colorType](self, "colorType"));
  [v4 encodeObject:v7 forKey:@"colorType"];
}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (void)setCourseIdentifier:(id)a3
{
}

- (unint64_t)mascotType
{
  return self->_mascotType;
}

- (void)setMascotType:(unint64_t)a3
{
  self->_mascotType = a3;
}

- (unint64_t)colorType
{
  return self->_colorType;
}

- (void)setColorType:(unint64_t)a3
{
  self->_colorType = a3;
}

- (void).cxx_destruct
{
}

@end