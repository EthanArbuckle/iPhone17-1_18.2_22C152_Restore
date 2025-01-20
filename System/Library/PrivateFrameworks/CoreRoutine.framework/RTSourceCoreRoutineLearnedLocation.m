@interface RTSourceCoreRoutineLearnedLocation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSUUID)identifier;
- (RTSourceCoreRoutineLearnedLocation)initWithCoder:(id)a3;
- (RTSourceCoreRoutineLearnedLocation)initWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTSourceCoreRoutineLearnedLocation

- (RTSourceCoreRoutineLearnedLocation)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTSourceCoreRoutineLearnedLocation;
  v5 = [(RTSourceCoreRoutineLearnedLocation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTSourceCoreRoutineLearnedLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTSourceCoreRoutineLearnedLocation;
  v5 = [(RTSourceCoreRoutine *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTSourceCoreRoutineLearnedLocation;
  id v4 = a3;
  [(RTSourceCoreRoutine *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, @"identifier", v5.receiver, v5.super_class);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  identifier = self->_identifier;
  return (id)[v4 initWithIdentifier:identifier];
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RTSourceCoreRoutineLearnedLocation;
  if ([(RTSource *)&v12 isEqual:v5])
  {
    id v6 = v5;
    v7 = [(RTSourceCoreRoutineLearnedLocation *)self identifier];
    if (v7 || ([v6 identifier], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = [(RTSourceCoreRoutineLearnedLocation *)self identifier];
      objc_super v9 = [v6 identifier];
      char v10 = [v8 isEqual:v9];

      if (v7)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      char v10 = 1;
    }

    goto LABEL_9;
  }
  char v10 = 0;
LABEL_10:

  return v10;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)RTSourceCoreRoutineLearnedLocation;
  unint64_t v3 = [(RTSource *)&v7 hash];
  id v4 = [(RTSourceCoreRoutineLearnedLocation *)self identifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end