@interface FAScreentimeSettingsObjectCache
+ (BOOL)supportsSecureCoding;
+ (Class)introductionModelClass;
+ (id)objectWithData:(id)a3;
- (FAScreentimeSettingsObjectCache)initWithCoder:(id)a3;
- (FAScreentimeSettingsObjectCache)initWithIntroductionModel:(id)a3 date:(id)a4 dsid:(id)a5;
- (NSDate)date;
- (NSNumber)memberDSID;
- (id)dataRepresentation;
- (id)introductionModel;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
- (void)setIntroductionModel:(id)a3;
- (void)setMemberDSID:(id)a3;
@end

@implementation FAScreentimeSettingsObjectCache

+ (Class)introductionModelClass
{
  return NSClassFromString(&cfstr_Stintroduction.isa);
}

- (FAScreentimeSettingsObjectCache)initWithIntroductionModel:(id)a3 date:(id)a4 dsid:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FAScreentimeSettingsObjectCache;
  v12 = [(FAScreentimeSettingsObjectCache *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_memberDSID, a5);
    objc_storeStrong((id *)&v13->_date, a4);
    objc_storeStrong(&v13->_introductionModel, a3);
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v5 = a3;
  [v5 encodeObject:date forKey:@"_date"];
  [v5 encodeObject:self->_introductionModel forKey:@"_introductionModel"];
  [v5 encodeObject:self->_memberDSID forKey:@"_memberDSID"];
}

- (FAScreentimeSettingsObjectCache)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FAScreentimeSettingsObjectCache *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_date"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    +[FAScreentimeSettingsObjectCache introductionModelClass];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_introductionModel"];
    id introductionModel = v5->_introductionModel;
    v5->_id introductionModel = (id)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_memberDSID"];
    memberDSID = v5->_memberDSID;
    v5->_memberDSID = (NSNumber *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (id)introductionModel
{
  return self->_introductionModel;
}

- (void)setIntroductionModel:(id)a3
{
}

- (NSNumber)memberDSID
{
  return self->_memberDSID;
}

- (void)setMemberDSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberDSID, 0);
  objc_storeStrong(&self->_introductionModel, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

+ (id)objectWithData:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initForReadingFromData:v4 error:0];

  uint64_t v6 = objc_opt_class();
  v7 = NSStringFromClass(+[FAScreentimeSettingsObjectCache introductionModelClass]);
  uint64_t v8 = [v5 decodeObjectOfClass:v6 forKey:v7];

  return v8;
}

- (id)dataRepresentation
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  id v4 = NSStringFromClass(+[FAScreentimeSettingsObjectCache introductionModelClass]);
  [v3 encodeObject:self forKey:v4];

  id v5 = [v3 encodedData];

  return v5;
}

@end