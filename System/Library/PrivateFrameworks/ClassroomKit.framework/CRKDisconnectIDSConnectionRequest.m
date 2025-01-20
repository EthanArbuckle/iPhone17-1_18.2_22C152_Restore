@interface CRKDisconnectIDSConnectionRequest
+ (BOOL)supportsSecureCoding;
- (CRKDisconnectIDSConnectionRequest)initWithCoder:(id)a3;
- (DMFControlGroupIdentifier)courseIdentifier;
- (NSString)instructorIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setCourseIdentifier:(id)a3;
- (void)setInstructorIdentifier:(id)a3;
@end

@implementation CRKDisconnectIDSConnectionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKDisconnectIDSConnectionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKDisconnectIDSConnectionRequest;
  v5 = [(CATTaskRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"courseIdentifier"];
    courseIdentifier = v5->_courseIdentifier;
    v5->_courseIdentifier = (DMFControlGroupIdentifier *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"instructorIdentifier"];
    instructorIdentifier = v5->_instructorIdentifier;
    v5->_instructorIdentifier = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKDisconnectIDSConnectionRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = [(CRKDisconnectIDSConnectionRequest *)self courseIdentifier];
  [v4 encodeObject:v5 forKey:@"courseIdentifier"];

  v6 = [(CRKDisconnectIDSConnectionRequest *)self instructorIdentifier];
  [v4 encodeObject:v6 forKey:@"instructorIdentifier"];
}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (void)setCourseIdentifier:(id)a3
{
}

- (NSString)instructorIdentifier
{
  return self->_instructorIdentifier;
}

- (void)setInstructorIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructorIdentifier, 0);

  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

@end