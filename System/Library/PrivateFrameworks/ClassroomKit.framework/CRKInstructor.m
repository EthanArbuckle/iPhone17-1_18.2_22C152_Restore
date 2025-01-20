@interface CRKInstructor
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsStudentInitiatedDisconnection;
- (BOOL)disallowsClassroomAirDropOverLocalNetwork;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToInstructor:(id)a3;
- (BOOL)isObservingStudentScreen;
- (CRKInstructor)initWithCoder:(id)a3;
- (DMFControlSessionIdentifier)sessionIdentifier;
- (NSData)imageData;
- (NSDictionary)dictionaryValue;
- (NSString)courseName;
- (NSString)displayName;
- (NSString)userIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsStudentInitiatedDisconnection:(BOOL)a3;
- (void)setCourseName:(id)a3;
- (void)setDisallowsClassroomAirDropOverLocalNetwork:(BOOL)a3;
- (void)setDisplayName:(id)a3;
- (void)setImageData:(id)a3;
- (void)setObservingStudentScreen:(BOOL)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setUserIdentifier:(id)a3;
@end

@implementation CRKInstructor

- (NSDictionary)dictionaryValue
{
  v3 = objc_opt_new();
  v4 = [(CRKInstructor *)self sessionIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"sessionIdentifier"];

  v5 = [(CRKInstructor *)self userIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"userIdentifier"];

  v6 = [(CRKInstructor *)self displayName];
  [v3 setObject:v6 forKeyedSubscript:@"displayName"];

  v7 = [(CRKInstructor *)self courseName];
  [v3 setObject:v7 forKeyedSubscript:@"courseName"];

  v8 = [(CRKInstructor *)self imageData];
  if (v8)
  {
    v9 = NSString;
    v10 = [(CRKInstructor *)self imageData];
    v11 = objc_msgSend(v9, "stringWithFormat:", @"Data with length %lu", objc_msgSend(v10, "length"));
    [v3 setObject:v11 forKeyedSubscript:@"imageData"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"imageData"];
  }

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKInstructor disallowsClassroomAirDropOverLocalNetwork](self, "disallowsClassroomAirDropOverLocalNetwork"));
  [v3 setObject:v12 forKeyedSubscript:@"disallowsClassroomAirDropOverLocalNetwork"];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKInstructor allowsStudentInitiatedDisconnection](self, "allowsStudentInitiatedDisconnection"));
  [v3 setObject:v13 forKeyedSubscript:@"allowsStudentInitiatedDisconnection"];

  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKInstructor isObservingStudentScreen](self, "isObservingStudentScreen"));
  [v3 setObject:v14 forKeyedSubscript:@"observingStudentScreen"];

  v15 = (void *)[v3 copy];

  return (NSDictionary *)v15;
}

- (unint64_t)hash
{
  v2 = [(CRKInstructor *)self sessionIdentifier];
  v3 = [v2 stringValue];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (CRKInstructor *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CRKInstructor *)self isEqualToInstructor:v4];
  }

  return v5;
}

- (BOOL)isEqualToInstructor:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRKInstructor *)self sessionIdentifier];
  v6 = [v4 sessionIdentifier];
  unint64_t v7 = v5;
  unint64_t v8 = v6;
  if (v7 | v8 && (int v9 = [(id)v7 isEqual:v8], (id)v8, (id)v7, !v9))
  {
    LOBYTE(v29) = 0;
  }
  else
  {
    v10 = [(CRKInstructor *)self userIdentifier];
    v11 = [v4 userIdentifier];
    unint64_t v12 = v10;
    unint64_t v13 = v11;
    if (v12 | v13 && (int v14 = [(id)v12 isEqual:v13], (id)v13, (id)v12, !v14))
    {
      LOBYTE(v29) = 0;
    }
    else
    {
      v15 = [(CRKInstructor *)self displayName];
      v16 = [v4 displayName];
      unint64_t v17 = v15;
      unint64_t v18 = v16;
      if (v17 | v18
        && (int v19 = [(id)v17 isEqual:v18], (id)v18, (id)v17, !v19))
      {
        LOBYTE(v29) = 0;
      }
      else
      {
        v20 = [(CRKInstructor *)self courseName];
        v21 = [v4 courseName];
        unint64_t v22 = v20;
        unint64_t v38 = v21;
        v39 = (void *)v22;
        if (v22 | v38
          && (int v36 = [(id)v22 isEqual:v38], (id)v38, (id)v22, !v36))
        {
          LOBYTE(v29) = 0;
        }
        else
        {
          unint64_t v34 = v17;
          v37 = [(CRKInstructor *)self imageData];
          v23 = objc_msgSend(v37, "crk_sha1Hash");
          v35 = [v4 imageData];
          v24 = objc_msgSend(v35, "crk_sha1Hash");
          unint64_t v25 = v23;
          unint64_t v26 = v24;
          if ((!(v25 | v26)
             || (int v27 = [(id)v25 isEqual:v26], (id)v26, (id)v25, v27))
            && (int v28 = -[CRKInstructor disallowsClassroomAirDropOverLocalNetwork](self, "disallowsClassroomAirDropOverLocalNetwork"), v28 == [v4 disallowsClassroomAirDropOverLocalNetwork]))
          {
            int v30 = [(CRKInstructor *)self allowsStudentInitiatedDisconnection];
            BOOL v31 = v30 == [v4 allowsStudentInitiatedDisconnection];
            unint64_t v17 = v34;
            if (v31)
            {
              BOOL v32 = [(CRKInstructor *)self isObservingStudentScreen];
              int v29 = v32 ^ [v4 isObservingStudentScreen] ^ 1;
            }
            else
            {
              LOBYTE(v29) = 0;
            }
          }
          else
          {
            LOBYTE(v29) = 0;
            unint64_t v17 = v34;
          }
        }
      }
    }
  }

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKInstructor)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CRKInstructor;
  BOOL v5 = [(CRKInstructor *)&v25 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"sessionIdentifier"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (DMFControlSessionIdentifier *)v7;

    int v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"userIdentifier"];
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v10;

    unint64_t v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v13;

    v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"courseName"];
    courseName = v5->_courseName;
    v5->_courseName = (NSString *)v16;

    unint64_t v18 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"imageData"];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v19;

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disallowsClassroomAirDropOverLocalNetwork"];
    v5->_disallowsClassroomAirDropOverLocalNetwork = [v21 BOOLValue];

    unint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsStudentInitiatedDisconnection"];
    v5->_allowsStudentInitiatedDisconnection = [v22 BOOLValue];

    v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"observingStudentScreen"];
    v5->_observingStudentScreen = [v23 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRKInstructor *)self sessionIdentifier];
  [v4 encodeObject:v5 forKey:@"sessionIdentifier"];

  v6 = [(CRKInstructor *)self userIdentifier];
  [v4 encodeObject:v6 forKey:@"userIdentifier"];

  uint64_t v7 = [(CRKInstructor *)self displayName];
  [v4 encodeObject:v7 forKey:@"displayName"];

  unint64_t v8 = [(CRKInstructor *)self courseName];
  [v4 encodeObject:v8 forKey:@"courseName"];

  int v9 = [(CRKInstructor *)self imageData];
  [v4 encodeObject:v9 forKey:@"imageData"];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKInstructor disallowsClassroomAirDropOverLocalNetwork](self, "disallowsClassroomAirDropOverLocalNetwork"));
  [v4 encodeObject:v10 forKey:@"disallowsClassroomAirDropOverLocalNetwork"];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKInstructor allowsStudentInitiatedDisconnection](self, "allowsStudentInitiatedDisconnection"));
  [v4 encodeObject:v11 forKey:@"allowsStudentInitiatedDisconnection"];

  objc_msgSend(NSNumber, "numberWithBool:", -[CRKInstructor isObservingStudentScreen](self, "isObservingStudentScreen"));
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"observingStudentScreen"];
}

- (DMFControlSessionIdentifier)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)courseName
{
  return self->_courseName;
}

- (void)setCourseName:(id)a3
{
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (BOOL)disallowsClassroomAirDropOverLocalNetwork
{
  return self->_disallowsClassroomAirDropOverLocalNetwork;
}

- (void)setDisallowsClassroomAirDropOverLocalNetwork:(BOOL)a3
{
  self->_disallowsClassroomAirDropOverLocalNetwork = a3;
}

- (BOOL)allowsStudentInitiatedDisconnection
{
  return self->_allowsStudentInitiatedDisconnection;
}

- (void)setAllowsStudentInitiatedDisconnection:(BOOL)a3
{
  self->_allowsStudentInitiatedDisconnection = a3;
}

- (BOOL)isObservingStudentScreen
{
  return self->_observingStudentScreen;
}

- (void)setObservingStudentScreen:(BOOL)a3
{
  self->_observingStudentScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_courseName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);

  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end