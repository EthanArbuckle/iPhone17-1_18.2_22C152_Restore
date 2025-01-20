@interface DEDBugSessionConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)archivedClasses;
+ (id)secureUnarchiveWithData:(id)a3;
- (BOOL)allowsCellularUpload;
- (BOOL)cloudkitUseDevelopmentEnvironment;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfiguration:(id)a3;
- (DEDBugSessionConfiguration)init;
- (DEDBugSessionConfiguration)initWithCoder:(id)a3;
- (DEDNotifierConfiguration)notifierConfiguration;
- (NSDictionary)cloudkitData;
- (NSNumber)radarProblemID;
- (NSString)cloudkitContainer;
- (NSString)radarAuthToken;
- (NSString)requestedCapabilitiesString;
- (NSString)seedingDeviceToken;
- (NSString)seedingHost;
- (double)bugSessionStartTimeout;
- (id)copyWithZone:(_NSZone *)a3;
- (id)requestedCapabilities;
- (id)secureArchive;
- (int64_t)finishingMove;
- (int64_t)notifyingMove;
- (int64_t)seedingEnvironment;
- (int64_t)seedingSubmissionID;
- (int64_t)seedingSubmissionType;
- (void)encodeWithCoder:(id)a3;
- (void)requestCapabilities:(id)a3;
- (void)requestCapabilitiesSet:(id)a3;
- (void)secureArchive;
- (void)setAllowsCellularUpload:(BOOL)a3;
- (void)setBugSessionStartTimeout:(double)a3;
- (void)setCloudkitContainer:(id)a3;
- (void)setCloudkitData:(id)a3;
- (void)setCloudkitUseDevelopmentEnvironment:(BOOL)a3;
- (void)setFinishingMove:(int64_t)a3;
- (void)setNotifierConfiguration:(id)a3;
- (void)setNotifyingMove:(int64_t)a3;
- (void)setRadarAuthToken:(id)a3;
- (void)setRadarProblemID:(id)a3;
- (void)setSeedingDeviceToken:(id)a3;
- (void)setSeedingEnvironment:(int64_t)a3;
- (void)setSeedingHost:(id)a3;
- (void)setSeedingSubmissionID:(int64_t)a3;
- (void)setSeedingSubmissionType:(int64_t)a3;
@end

@implementation DEDBugSessionConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDBugSessionConfiguration finishingMove](self, "finishingMove"), @"finishingMove");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDBugSessionConfiguration notifyingMove](self, "notifyingMove"), @"notifyingMove");
  objc_msgSend(v4, "encodeBool:forKey:", -[DEDBugSessionConfiguration allowsCellularUpload](self, "allowsCellularUpload"), @"allowsCellularUpload");
  v5 = [(DEDBugSessionConfiguration *)self requestedCapabilitiesString];
  [v4 encodeObject:v5 forKey:@"capabilities"];

  v6 = [(DEDBugSessionConfiguration *)self seedingDeviceToken];
  [v4 encodeObject:v6 forKey:@"seedingDeviceToken"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDBugSessionConfiguration seedingSubmissionType](self, "seedingSubmissionType"), @"seedingSubmissionType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDBugSessionConfiguration seedingSubmissionID](self, "seedingSubmissionID"), @"seedingSubmissionID");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDBugSessionConfiguration seedingEnvironment](self, "seedingEnvironment"), @"seedingEnvironment");
  v7 = [(DEDBugSessionConfiguration *)self seedingHost];
  [v4 encodeObject:v7 forKey:@"seedingHost"];

  v8 = [(DEDBugSessionConfiguration *)self radarProblemID];
  [v4 encodeObject:v8 forKey:@"radarProblemID"];

  v9 = [(DEDBugSessionConfiguration *)self radarAuthToken];
  [v4 encodeObject:v9 forKey:@"radarAuthToken"];

  v10 = [(DEDBugSessionConfiguration *)self cloudkitContainer];
  [v4 encodeObject:v10 forKey:@"cloudkitContainer"];

  objc_msgSend(v4, "encodeBool:forKey:", -[DEDBugSessionConfiguration cloudkitUseDevelopmentEnvironment](self, "cloudkitUseDevelopmentEnvironment"), @"cloudkitUseDevelopmentEnvironment");
  v11 = [(DEDBugSessionConfiguration *)self cloudkitData];
  [v4 encodeObject:v11 forKey:@"cloudkitData"];

  id v12 = [(DEDBugSessionConfiguration *)self notifierConfiguration];
  [v4 encodeObject:v12 forKey:@"notifierConfiguration"];
}

- (DEDBugSessionConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)DEDBugSessionConfiguration;
  result = [(DEDBugSessionConfiguration *)&v3 init];
  if (result) {
    result->_bugSessionStartTimeout = 20.0;
  }
  return result;
}

- (DEDBugSessionConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)DEDBugSessionConfiguration;
  v5 = [(DEDBugSessionConfiguration *)&v27 init];
  v6 = v5;
  if (v5)
  {
    v5->_bugSessionStartTimeout = 20.0;
    v5->_finishingMove = [v4 decodeIntegerForKey:@"finishingMove"];
    v6->_notifyingMove = [v4 decodeIntegerForKey:@"notifyingMove"];
    v6->_allowsCellularUpload = [v4 decodeBoolForKey:@"allowsCellularUpload"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"capabilities"];
    v8 = v7;
    if (v7 && ![v7 isEqualToString:&stru_26D197018])
    {
      uint64_t v9 = +[DEDCapability decodeCapabilitiesString:v8];
    }
    else
    {
      uint64_t v9 = +[DEDCapability defaultCapabilities];
    }
    requestedCapabilities = v6->_requestedCapabilities;
    v6->_requestedCapabilities = (NSSet *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seedingDeviceToken"];
    seedingDeviceToken = v6->_seedingDeviceToken;
    v6->_seedingDeviceToken = (NSString *)v11;

    v6->_seedingSubmissionType = [v4 decodeIntegerForKey:@"seedingSubmissionType"];
    v6->_seedingSubmissionID = [v4 decodeIntegerForKey:@"seedingSubmissionID"];
    v6->_seedingEnvironment = [v4 decodeIntegerForKey:@"seedingEnvironment"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seedingHost"];
    seedingHost = v6->_seedingHost;
    v6->_seedingHost = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"radarProblemID"];
    radarProblemID = v6->_radarProblemID;
    v6->_radarProblemID = (NSNumber *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"radarAuthToken"];
    radarAuthToken = v6->_radarAuthToken;
    v6->_radarAuthToken = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cloudkitContainer"];
    cloudkitContainer = v6->_cloudkitContainer;
    v6->_cloudkitContainer = (NSString *)v19;

    v6->_cloudkitUseDevelopmentEnvironment = [v4 decodeBoolForKey:@"cloudkitUseDevelopmentEnvironment"];
    v21 = [(id)objc_opt_class() archivedClasses];
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"cloudkitData"];
    cloudkitData = v6->_cloudkitData;
    v6->_cloudkitData = (NSDictionary *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notifierConfiguration"];
    notifierConfiguration = v6->_notifierConfiguration;
    v6->_notifierConfiguration = (DEDNotifierConfiguration *)v24;
  }
  return v6;
}

- (NSString)requestedCapabilitiesString
{
  requestedCapabilities = self->_requestedCapabilities;
  if (!requestedCapabilities)
  {
    id v4 = +[DEDCapability defaultCapabilities];
    v5 = self->_requestedCapabilities;
    self->_requestedCapabilities = v4;

    requestedCapabilities = self->_requestedCapabilities;
  }
  return (NSString *)+[DEDCapability encodeCapabilitySet:requestedCapabilities];
}

- (void)requestCapabilitiesSet:(id)a3
{
  self->_requestedCapabilities = [a3 setByAddingObject:@"classic"];
  MEMORY[0x270F9A758]();
}

- (void)requestCapabilities:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9C0] setWithObject:@"classic"];
  id v12 = (id *)&v13;
  id v6 = v4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    do
    {
      [(NSSet *)v5 addObject:v7];
      uint64_t v9 = v12++;
      id v10 = *v9;

      v8 = v10;
    }
    while (v10);
  }
  requestedCapabilities = self->_requestedCapabilities;
  self->_requestedCapabilities = v5;
}

- (id)requestedCapabilities
{
  requestedCapabilities = self->_requestedCapabilities;
  if (!requestedCapabilities)
  {
    id v4 = +[DEDCapability defaultCapabilities];
    v5 = self->_requestedCapabilities;
    self->_requestedCapabilities = v4;

    requestedCapabilities = self->_requestedCapabilities;
  }
  id v6 = (void *)[(NSSet *)requestedCapabilities copy];
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = [(DEDBugSessionConfiguration *)self secureArchive];
  id v4 = +[DEDBugSessionConfiguration secureUnarchiveWithData:v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DEDBugSessionConfiguration *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(DEDBugSessionConfiguration *)self isEqualToConfiguration:v4];
  }

  return v5;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v7 = a3;
  if (!v7
    || (int64_t v8 = -[DEDBugSessionConfiguration finishingMove](self, "finishingMove"), v8 != [v7 finishingMove])
    || (int64_t v9 = -[DEDBugSessionConfiguration notifyingMove](self, "notifyingMove"), v9 != [v7 notifyingMove])
    || (int v10 = [(DEDBugSessionConfiguration *)self allowsCellularUpload],
        v10 != [v7 allowsCellularUpload]))
  {
    char v11 = 0;
    goto LABEL_6;
  }
  uint64_t v13 = [(DEDBugSessionConfiguration *)self seedingDeviceToken];
  if (v13 || ([v7 seedingDeviceToken], (objc_super v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = [(DEDBugSessionConfiguration *)self seedingDeviceToken];
    BOOL v5 = [v7 seedingDeviceToken];
    if (([v4 isEqualToString:v5] & 1) == 0)
    {

      char v11 = 0;
      goto LABEL_22;
    }
    int v14 = 1;
  }
  else
  {
    int v14 = 0;
  }
  int64_t v15 = [(DEDBugSessionConfiguration *)self seedingSubmissionID];
  if (v15 == [v7 seedingSubmissionID])
  {
    int64_t v16 = [(DEDBugSessionConfiguration *)self seedingSubmissionType];
    if (v16 == [v7 seedingSubmissionType])
    {
      int64_t v17 = [(DEDBugSessionConfiguration *)self seedingEnvironment];
      if (v17 == [v7 seedingEnvironment])
      {
        v18 = [(DEDBugSessionConfiguration *)self seedingHost];
        if (v18 || ([v7 seedingHost], (v60 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v19 = [(DEDBugSessionConfiguration *)self seedingHost];
          v65 = [v7 seedingHost];
          if (!objc_msgSend(v19, "isEqualToString:"))
          {
            char v11 = 0;
            goto LABEL_87;
          }
          v58 = v19;
          int v64 = 1;
        }
        else
        {
          v60 = 0;
          int v64 = 0;
        }
        v20 = [(DEDBugSessionConfiguration *)self radarProblemID];
        if (v20 || ([v7 radarProblemID], (v54 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v21 = [(DEDBugSessionConfiguration *)self radarProblemID];
          v61 = [v7 radarProblemID];
          v62 = v21;
          if (!objc_msgSend(v21, "isEqualToNumber:"))
          {
            char v11 = 0;
LABEL_82:

LABEL_83:
            if (!v20) {

            }
            if (!v64)
            {
LABEL_88:
              if (!v18) {

              }
              if (!v14) {
                goto LABEL_22;
              }
              goto LABEL_21;
            }
            uint64_t v19 = v58;
LABEL_87:

            goto LABEL_88;
          }
          int v57 = 1;
        }
        else
        {
          v54 = 0;
          int v57 = 0;
        }
        uint64_t v59 = [(DEDBugSessionConfiguration *)self radarAuthToken];
        if (v59 || ([v7 radarAuthToken], (v50 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v22 = [(DEDBugSessionConfiguration *)self radarAuthToken];
          v55 = [v7 radarAuthToken];
          v56 = v22;
          if (!objc_msgSend(v22, "isEqualToString:"))
          {
            char v11 = 0;
LABEL_78:

            goto LABEL_79;
          }
          int v23 = 1;
        }
        else
        {
          v50 = 0;
          int v23 = 0;
        }
        v51 = v20;
        uint64_t v53 = [(DEDBugSessionConfiguration *)self cloudkitContainer];
        int v52 = v23;
        if (v53 || ([v7 cloudkitContainer], (v48 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v24 = [(DEDBugSessionConfiguration *)self cloudkitContainer];
          v20 = [v7 cloudkitContainer];
          if (([v24 isEqualToString:v20] & 1) == 0)
          {

            v25 = (void *)v53;
            if (!v53) {
              v25 = v48;
            }

            char v11 = 0;
            v20 = v51;
            if (v52) {
              goto LABEL_78;
            }
            goto LABEL_79;
          }
          v46 = v20;
          v47 = v24;
          int v49 = 1;
        }
        else
        {
          v48 = 0;
          int v49 = 0;
        }
        int v26 = [(DEDBugSessionConfiguration *)self cloudkitUseDevelopmentEnvironment];
        if (v26 != [v7 cloudkitUseDevelopmentEnvironment])
        {
          char v11 = 0;
          int v27 = v52;
          if ((v49 & 1) == 0) {
            goto LABEL_75;
          }
          goto LABEL_74;
        }
        [(DEDBugSessionConfiguration *)self cloudkitData];
        v45 = int v27 = v52;
        if (v45 || ([v7 cloudkitData], (v40 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v28 = [(DEDBugSessionConfiguration *)self cloudkitData];
          uint64_t v29 = [v7 cloudkitData];
          v44 = (void *)v28;
          v30 = (void *)v28;
          v20 = (void *)v29;
          if (![v30 isEqualToDictionary:v29])
          {
            char v11 = 0;
            goto LABEL_68;
          }
          char v41 = 1;
        }
        else
        {
          v40 = 0;
          char v41 = 0;
        }
        v31 = [(DEDBugSessionConfiguration *)self requestedCapabilitiesString];
        v42 = [v7 requestedCapabilitiesString];
        v43 = v31;
        if (objc_msgSend(v31, "isEqualToString:"))
        {
          v39 = v20;
          v63 = v18;
          v32 = [(DEDBugSessionConfiguration *)self notifierConfiguration];
          if (v32
            || ([v7 notifierConfiguration], (v38 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v33 = [(DEDBugSessionConfiguration *)self notifierConfiguration];
            v34 = [v7 notifierConfiguration];
            char v11 = [v33 isEqual:v34];

            if (v32)
            {

LABEL_66:
              if (v41)
              {
                v18 = v63;
                int v27 = v52;
                v20 = v39;
                goto LABEL_68;
              }
              v18 = v63;
LABEL_70:
              int v27 = v52;
LABEL_71:
              v35 = (void *)v45;
              if (!v45)
              {

                v35 = 0;
              }

              if (!v49)
              {
LABEL_75:
                v36 = (void *)v53;
                v20 = v51;
                if (!v53)
                {

                  v36 = 0;
                }

                if (v27) {
                  goto LABEL_78;
                }
LABEL_79:
                v37 = (void *)v59;
                if (!v59)
                {

                  v37 = 0;
                }

                if (!v57) {
                  goto LABEL_83;
                }
                goto LABEL_82;
              }
LABEL_74:

              goto LABEL_75;
            }
          }
          else
          {
            v38 = 0;
            char v11 = 1;
          }

          goto LABEL_66;
        }

        char v11 = 0;
        if ((v41 & 1) == 0) {
          goto LABEL_70;
        }
        int v27 = v52;
LABEL_68:

        goto LABEL_71;
      }
    }
  }
  char v11 = 0;
  if (v14)
  {
LABEL_21:
  }
LABEL_22:
  if (!v13)
  {

    uint64_t v13 = 0;
  }

LABEL_6:
  return v11;
}

+ (id)archivedClasses
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  int64_t v8 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, objc_opt_class(), 0);
  int64_t v9 = +[DEDNotifierConfiguration archivedClasses];
  [v8 unionSet:v9];

  return v8;
}

- (id)secureArchive
{
  id v7 = 0;
  v2 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v7];
  id v3 = v7;
  if (v3)
  {
    uint64_t v4 = +[DEDUtils sharedLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(DEDBugSessionConfiguration *)(uint64_t)v3 secureArchive];
    }

    id v5 = 0;
  }
  else
  {
    id v5 = v2;
  }

  return v5;
}

+ (id)secureUnarchiveWithData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x263F08928];
    id v5 = +[DEDBugSessionConfiguration archivedClasses];
    id v11 = 0;
    uint64_t v6 = [v4 unarchivedObjectOfClasses:v5 fromData:v3 error:&v11];
    id v7 = v11;

    if (v7)
    {
      int64_t v8 = +[DEDUtils sharedLog];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[DEDBugSessionConfiguration secureUnarchiveWithData:]((uint64_t)v7, v8);
      }

      id v9 = 0;
    }
    else
    {
      id v9 = v6;
    }
  }
  else
  {
    id v7 = +[DEDUtils sharedLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[DEDBugSessionConfiguration secureUnarchiveWithData:](v7);
    }
    id v9 = 0;
  }

  return v9;
}

- (int64_t)finishingMove
{
  return self->_finishingMove;
}

- (void)setFinishingMove:(int64_t)a3
{
  self->_finishingMove = a3;
}

- (int64_t)notifyingMove
{
  return self->_notifyingMove;
}

- (void)setNotifyingMove:(int64_t)a3
{
  self->_notifyingMove = a3;
}

- (BOOL)allowsCellularUpload
{
  return self->_allowsCellularUpload;
}

- (void)setAllowsCellularUpload:(BOOL)a3
{
  self->_allowsCellularUpload = a3;
}

- (double)bugSessionStartTimeout
{
  return self->_bugSessionStartTimeout;
}

- (void)setBugSessionStartTimeout:(double)a3
{
  self->_bugSessionStartTimeout = a3;
}

- (NSString)seedingDeviceToken
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSeedingDeviceToken:(id)a3
{
}

- (int64_t)seedingSubmissionID
{
  return self->_seedingSubmissionID;
}

- (void)setSeedingSubmissionID:(int64_t)a3
{
  self->_seedingSubmissionID = a3;
}

- (int64_t)seedingSubmissionType
{
  return self->_seedingSubmissionType;
}

- (void)setSeedingSubmissionType:(int64_t)a3
{
  self->_seedingSubmissionType = a3;
}

- (int64_t)seedingEnvironment
{
  return self->_seedingEnvironment;
}

- (void)setSeedingEnvironment:(int64_t)a3
{
  self->_seedingEnvironment = a3;
}

- (NSString)seedingHost
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSeedingHost:(id)a3
{
}

- (NSNumber)radarProblemID
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRadarProblemID:(id)a3
{
}

- (NSString)radarAuthToken
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRadarAuthToken:(id)a3
{
}

- (NSString)cloudkitContainer
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCloudkitContainer:(id)a3
{
}

- (BOOL)cloudkitUseDevelopmentEnvironment
{
  return self->_cloudkitUseDevelopmentEnvironment;
}

- (void)setCloudkitUseDevelopmentEnvironment:(BOOL)a3
{
  self->_cloudkitUseDevelopmentEnvironment = a3;
}

- (NSDictionary)cloudkitData
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCloudkitData:(id)a3
{
}

- (DEDNotifierConfiguration)notifierConfiguration
{
  return (DEDNotifierConfiguration *)objc_getProperty(self, a2, 120, 1);
}

- (void)setNotifierConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifierConfiguration, 0);
  objc_storeStrong((id *)&self->_cloudkitData, 0);
  objc_storeStrong((id *)&self->_cloudkitContainer, 0);
  objc_storeStrong((id *)&self->_radarAuthToken, 0);
  objc_storeStrong((id *)&self->_radarProblemID, 0);
  objc_storeStrong((id *)&self->_seedingHost, 0);
  objc_storeStrong((id *)&self->_seedingDeviceToken, 0);
  objc_storeStrong((id *)&self->_requestedCapabilities, 0);
}

- (void)secureArchive
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "failed to archive config with error: [%{public}@]", (uint8_t *)&v2, 0xCu);
}

+ (void)secureUnarchiveWithData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "failed to unarchive config data with error: given data is nil", v1, 2u);
}

+ (void)secureUnarchiveWithData:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "failed to unarchive config data with error: [%{public}@]", (uint8_t *)&v2, 0xCu);
}

@end