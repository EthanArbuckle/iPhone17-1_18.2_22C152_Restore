@interface APKActivityProgressTasksSpecifier
+ (BOOL)supportsSecureCoding;
- (APKActivityProgressTasksSpecifier)initWithCoder:(id)a3;
- (APKActivityProgressTasksSpecifier)initWithTaskIdentifiers:(id)a3;
- (NSArray)taskIdentifiers;
- (void)encodeWithCoder:(id)a3;
@end

@implementation APKActivityProgressTasksSpecifier

- (APKActivityProgressTasksSpecifier)initWithTaskIdentifiers:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APKActivityProgressTasksSpecifier;
  v6 = [(APKActivityProgressTasksSpecifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_taskIdentifiers, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(APKActivityProgressTasksSpecifier *)self taskIdentifiers];
  [v4 encodeObject:v5 forKey:@"taskIdentifiers"];
}

- (APKActivityProgressTasksSpecifier)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"taskIdentifiers"];

  v6 = [(APKActivityProgressTasksSpecifier *)self initWithTaskIdentifiers:v5];
  return v6;
}

- (NSArray)taskIdentifiers
{
  return self->_taskIdentifiers;
}

- (void).cxx_destruct
{
}

@end