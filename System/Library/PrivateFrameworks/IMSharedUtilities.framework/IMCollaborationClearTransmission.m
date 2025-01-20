@interface IMCollaborationClearTransmission
+ (BOOL)supportsSecureCoding;
- (IMCollaborationClearTransmission)initWithCoder:(id)a3;
- (IMCollaborationClearTransmission)initWithCollaborationId:(id)a3 date:(id)a4 guidString:(id)a5;
- (NSDate)date;
- (NSString)collaborationId;
- (NSString)guidString;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMCollaborationClearTransmission

- (IMCollaborationClearTransmission)initWithCollaborationId:(id)a3 date:(id)a4 guidString:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IMCollaborationClearTransmission;
  v12 = [(IMCollaborationClearTransmission *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_collaborationId, a3);
    objc_storeStrong((id *)&v13->_date, a4);
    objc_storeStrong((id *)&v13->_guidString, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(IMCollaborationClearTransmission *)self collaborationId];
  v6 = NSStringFromSelector(sel_collaborationId);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(IMCollaborationClearTransmission *)self date];
  v8 = NSStringFromSelector(sel_date);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(IMCollaborationClearTransmission *)self guidString];
  id v9 = NSStringFromSelector(sel_guidString);
  [v4 encodeObject:v10 forKey:v9];
}

- (IMCollaborationClearTransmission)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)IMCollaborationClearTransmission;
  v5 = [(IMCollaborationClearTransmission *)&v19 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_collaborationId);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    collaborationId = v5->_collaborationId;
    v5->_collaborationId = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    id v11 = NSStringFromSelector(sel_date);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    date = v5->_date;
    v5->_date = (NSDate *)v12;

    uint64_t v14 = objc_opt_class();
    objc_super v15 = NSStringFromSelector(sel_guidString);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    guidString = v5->_guidString;
    v5->_guidString = (NSString *)v16;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(IMCollaborationClearTransmission *)self collaborationId];
  v7 = [v3 stringWithFormat:@"<%@ %p collaborationId = %@", v5, self, v6];

  return v7;
}

- (NSString)collaborationId
{
  return self->_collaborationId;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)guidString
{
  return self->_guidString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidString, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_collaborationId, 0);
}

@end