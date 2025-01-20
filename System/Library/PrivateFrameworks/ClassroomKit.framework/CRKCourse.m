@interface CRKCourse
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffectingExpired;
+ (id)new;
+ (id)stringForType:(unint64_t)a3;
- (BOOL)allowsUnenroll;
- (BOOL)isDeeplyEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCourse:(id)a3;
- (BOOL)isExpired;
- (BOOL)isManaged;
- (BOOL)isRequestingUnenroll;
- (BOOL)mustRequestUnenroll;
- (BOOL)studentCredentialsAreValid;
- (CRKCourse)init;
- (CRKCourse)initWithCoder:(id)a3;
- (CRKCourse)initWithIdentifier:(id)a3 managed:(BOOL)a4;
- (CRKCourse)initWithIdentifier:(id)a3 type:(unint64_t)a4;
- (CRKUser)courseUser;
- (DMFControlGroupIdentifier)courseIdentifier;
- (NSDate)automaticRemovalDate;
- (NSDictionary)instructorsByIdentifier;
- (NSSet)trustedCertificatePersistentIds;
- (NSSet)validTrustedCertificatePersistentIds;
- (NSString)courseDescription;
- (NSString)courseName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)courseColorType;
- (unint64_t)courseMascotType;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAutomaticRemovalDate:(id)a3;
- (void)setCourseColorType:(unint64_t)a3;
- (void)setCourseDescription:(id)a3;
- (void)setCourseIdentifier:(id)a3;
- (void)setCourseMascotType:(unint64_t)a3;
- (void)setCourseName:(id)a3;
- (void)setCourseUser:(id)a3;
- (void)setInstructorsByIdentifier:(id)a3;
- (void)setManaged:(BOOL)a3;
- (void)setMustRequestUnenroll:(BOOL)a3;
- (void)setRequestingUnenroll:(BOOL)a3;
- (void)setStudentCredentialsAreValid:(BOOL)a3;
- (void)setTrustedCertificatePersistentIds:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setValidTrustedCertificatePersistentIds:(id)a3;
@end

@implementation CRKCourse

- (CRKCourse)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CRKCourse.m", 34, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)CRKCourse;
  v9 = [(CRKCourse *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_courseIdentifier, a3);
    v10->_type = a4;
  }

  return v10;
}

- (CRKCourse)initWithIdentifier:(id)a3 managed:(BOOL)a4
{
  return [(CRKCourse *)self initWithIdentifier:a3 type:!a4];
}

- (BOOL)isManaged
{
  return [(CRKCourse *)self type] == 0;
}

- (BOOL)allowsUnenroll
{
  return [(CRKCourse *)self type] == 1;
}

- (BOOL)mustRequestUnenroll
{
  return self->_mustRequestUnenroll || self->_requestingUnenroll;
}

- (void)setManaged:(BOOL)a3
{
}

+ (id)stringForType:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_2646F4080[a3];
  }
}

+ (id)keyPathsForValuesAffectingExpired
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"studentCredentialsAreValid";
  v6[1] = @"validTrustedCertificatePersistentIds";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (BOOL)isExpired
{
  if ([(CRKCourse *)self type] == 2) {
    return 0;
  }
  if (![(CRKCourse *)self studentCredentialsAreValid]) {
    return 1;
  }
  v4 = [(CRKCourse *)self validTrustedCertificatePersistentIds];
  BOOL v3 = [v4 count] == 0;

  return v3;
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CRKCourse *)self courseIdentifier];
  v6 = [(CRKCourse *)self courseName];
  v7 = [(CRKCourse *)self courseUser];
  id v8 = [(CRKCourse *)self instructorsByIdentifier];
  v9 = [v8 allValues];
  v10 = [v3 stringWithFormat:@"<%@: %p {identifier = %@, name = %@, studentUser = %@, instructors = %@ }>", v4, self, v5, v6, v7, v9];

  return v10;
}

- (unint64_t)hash
{
  v2 = [(CRKCourse *)self courseIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CRKCourse *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CRKCourse *)self isEqualToCourse:v4];
  }

  return v5;
}

- (BOOL)isEqualToCourse:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRKCourse *)self courseIdentifier];
  v6 = [v4 courseIdentifier];
  unint64_t v7 = v5;
  unint64_t v8 = v6;
  if (v7 | v8 && (int v9 = [(id)v7 isEqual:v8], (id)v8, (id)v7, !v9))
  {
    BOOL v11 = 0;
  }
  else
  {
    unint64_t v10 = [(CRKCourse *)self type];
    BOOL v11 = v10 == [v4 type];
  }

  return v11;
}

- (BOOL)isDeeplyEqual:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = objc_msgSend(@"courseIdentifier, courseName, courseDescription, courseMascotType, courseColorType, courseUser, instructorsByIdentifier, type, mustRequestUnenroll, requestingUnenroll, automaticRemovalDate, expired", "componentsSeparatedByString:", @",");
  v6 = (void *)[v5 mutableCopy];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_5;
  v28[3] = &unk_2646F3750;
  id v7 = v6;
  id v29 = v7;
  [v7 enumerateObjectsUsingBlock:v28];

  unint64_t v8 = self;
  int v9 = (CRKCourse *)v4;
  id v10 = v7;
  if (v8 == v9)
  {
    BOOL v21 = 1;
  }
  else if ([(CRKCourse *)v9 isMemberOfClass:objc_opt_class()])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v23 = v10;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v24 + 1) + 8 * i);
          v17 = v9;
          uint64_t v18 = [(CRKCourse *)v8 valueForKey:v16];
          uint64_t v19 = [(CRKCourse *)v17 valueForKey:v16];

          if (v18 | v19)
          {
            int v20 = [(id)v18 isEqual:v19];

            if (!v20)
            {
              BOOL v21 = 0;
              goto LABEL_16;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      BOOL v21 = 1;
LABEL_16:
      id v10 = v23;
    }
    else
    {
      BOOL v21 = 1;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKCourse)initWithCoder:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CRKCourse;
  BOOL v5 = [(CRKCourse *)&v46 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"courseIdentifier"];
    courseIdentifier = v5->_courseIdentifier;
    v5->_courseIdentifier = (DMFControlGroupIdentifier *)v7;

    int v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"courseName"];
    courseName = v5->_courseName;
    v5->_courseName = (NSString *)v10;

    uint64_t v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"courseDescription"];
    courseDescription = v5->_courseDescription;
    v5->_courseDescription = (NSString *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"courseMascotType"];
    v5->_courseMascotType = [v15 unsignedIntegerValue];

    id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"courseColorType"];
    v5->_courseColorType = [v16 unsignedIntegerValue];

    v17 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"courseUser"];
    courseUser = v5->_courseUser;
    v5->_courseUser = (CRKUser *)v18;

    int v20 = (void *)MEMORY[0x263EFFA08];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    id v23 = objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"instructorsByIdentifier"];
    instructorsByIdentifier = v5->_instructorsByIdentifier;
    v5->_instructorsByIdentifier = (NSDictionary *)v24;

    long long v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v26 unsignedIntegerValue];

    long long v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mustRequestUnenroll"];
    v5->_mustRequestUnenroll = [v27 BOOLValue];

    v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestingUnenroll"];
    v5->_requestingUnenroll = [v28 BOOLValue];

    id v29 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"automaticRemovalDate"];
    automaticRemovalDate = v5->_automaticRemovalDate;
    v5->_automaticRemovalDate = (NSDate *)v30;

    v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"studentCredentialsAreValid"];
    v5->_studentCredentialsAreValid = [v32 BOOLValue];

    v33 = (void *)MEMORY[0x263EFFA08];
    uint64_t v34 = objc_opt_class();
    v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"trustedCertificatePersistentIds"];
    trustedCertificatePersistentIds = v5->_trustedCertificatePersistentIds;
    v5->_trustedCertificatePersistentIds = (NSSet *)v36;

    v38 = (void *)MEMORY[0x263EFFA08];
    uint64_t v39 = objc_opt_class();
    v40 = objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
    uint64_t v41 = [v4 decodeObjectOfClasses:v40 forKey:@"validTrustedCertificatePersistentIds"];
    validTrustedCertificatePersistentIds = v5->_validTrustedCertificatePersistentIds;
    v5->_validTrustedCertificatePersistentIds = (NSSet *)v41;

    v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"managed"];
    v44 = v43;
    if (v43) {
      v5->_type = [v43 BOOLValue] ^ 1;
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRKCourse *)self courseIdentifier];
  [v4 encodeObject:v5 forKey:@"courseIdentifier"];

  v6 = [(CRKCourse *)self courseName];
  [v4 encodeObject:v6 forKey:@"courseName"];

  uint64_t v7 = [(CRKCourse *)self courseDescription];
  [v4 encodeObject:v7 forKey:@"courseDescription"];

  unint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKCourse courseMascotType](self, "courseMascotType"));
  [v4 encodeObject:v8 forKey:@"courseMascotType"];

  int v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKCourse courseColorType](self, "courseColorType"));
  [v4 encodeObject:v9 forKey:@"courseColorType"];

  uint64_t v10 = [(CRKCourse *)self courseUser];
  [v4 encodeObject:v10 forKey:@"courseUser"];

  id v11 = [(CRKCourse *)self instructorsByIdentifier];
  [v4 encodeObject:v11 forKey:@"instructorsByIdentifier"];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKCourse type](self, "type"));
  [v4 encodeObject:v12 forKey:@"type"];

  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKCourse mustRequestUnenroll](self, "mustRequestUnenroll"));
  [v4 encodeObject:v13 forKey:@"mustRequestUnenroll"];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKCourse isRequestingUnenroll](self, "isRequestingUnenroll"));
  [v4 encodeObject:v14 forKey:@"requestingUnenroll"];

  v15 = [(CRKCourse *)self automaticRemovalDate];
  [v4 encodeObject:v15 forKey:@"automaticRemovalDate"];

  id v16 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKCourse isExpired](self, "isExpired"));
  [v4 encodeObject:v16 forKey:@"expired"];

  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKCourse studentCredentialsAreValid](self, "studentCredentialsAreValid"));
  [v4 encodeObject:v17 forKey:@"studentCredentialsAreValid"];

  uint64_t v18 = [(CRKCourse *)self trustedCertificatePersistentIds];
  [v4 encodeObject:v18 forKey:@"trustedCertificatePersistentIds"];

  id v19 = [(CRKCourse *)self validTrustedCertificatePersistentIds];
  [v4 encodeObject:v19 forKey:@"validTrustedCertificatePersistentIds"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CRKCourse alloc];
  BOOL v5 = [(CRKCourse *)self courseIdentifier];
  v6 = [(CRKCourse *)v4 initWithIdentifier:v5 type:[(CRKCourse *)self type]];

  uint64_t v7 = [(CRKCourse *)self courseName];
  [(CRKCourse *)v6 setCourseName:v7];

  unint64_t v8 = [(CRKCourse *)self courseDescription];
  [(CRKCourse *)v6 setCourseDescription:v8];

  [(CRKCourse *)v6 setCourseMascotType:[(CRKCourse *)self courseMascotType]];
  [(CRKCourse *)v6 setCourseColorType:[(CRKCourse *)self courseColorType]];
  int v9 = [(CRKCourse *)self courseUser];
  [(CRKCourse *)v6 setCourseUser:v9];

  uint64_t v10 = [(CRKCourse *)self instructorsByIdentifier];
  [(CRKCourse *)v6 setInstructorsByIdentifier:v10];

  [(CRKCourse *)v6 setMustRequestUnenroll:[(CRKCourse *)self mustRequestUnenroll]];
  [(CRKCourse *)v6 setRequestingUnenroll:[(CRKCourse *)self isRequestingUnenroll]];
  id v11 = [(CRKCourse *)self automaticRemovalDate];
  [(CRKCourse *)v6 setAutomaticRemovalDate:v11];

  [(CRKCourse *)v6 setStudentCredentialsAreValid:[(CRKCourse *)self studentCredentialsAreValid]];
  uint64_t v12 = [(CRKCourse *)self trustedCertificatePersistentIds];
  [(CRKCourse *)v6 setTrustedCertificatePersistentIds:v12];

  uint64_t v13 = [(CRKCourse *)self validTrustedCertificatePersistentIds];
  [(CRKCourse *)v6 setValidTrustedCertificatePersistentIds:v13];

  return v6;
}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (void)setCourseIdentifier:(id)a3
{
}

- (NSString)courseName
{
  return self->_courseName;
}

- (void)setCourseName:(id)a3
{
}

- (NSString)courseDescription
{
  return self->_courseDescription;
}

- (void)setCourseDescription:(id)a3
{
}

- (unint64_t)courseMascotType
{
  return self->_courseMascotType;
}

- (void)setCourseMascotType:(unint64_t)a3
{
  self->_courseMascotType = a3;
}

- (unint64_t)courseColorType
{
  return self->_courseColorType;
}

- (void)setCourseColorType:(unint64_t)a3
{
  self->_courseColorType = a3;
}

- (CRKUser)courseUser
{
  return self->_courseUser;
}

- (void)setCourseUser:(id)a3
{
}

- (NSDictionary)instructorsByIdentifier
{
  return self->_instructorsByIdentifier;
}

- (void)setInstructorsByIdentifier:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setMustRequestUnenroll:(BOOL)a3
{
  self->_mustRequestUnenroll = a3;
}

- (BOOL)isRequestingUnenroll
{
  return self->_requestingUnenroll;
}

- (void)setRequestingUnenroll:(BOOL)a3
{
  self->_requestingUnenroll = a3;
}

- (NSDate)automaticRemovalDate
{
  return self->_automaticRemovalDate;
}

- (void)setAutomaticRemovalDate:(id)a3
{
}

- (BOOL)studentCredentialsAreValid
{
  return self->_studentCredentialsAreValid;
}

- (void)setStudentCredentialsAreValid:(BOOL)a3
{
  self->_studentCredentialsAreValid = a3;
}

- (NSSet)trustedCertificatePersistentIds
{
  return self->_trustedCertificatePersistentIds;
}

- (void)setTrustedCertificatePersistentIds:(id)a3
{
}

- (NSSet)validTrustedCertificatePersistentIds
{
  return self->_validTrustedCertificatePersistentIds;
}

- (void)setValidTrustedCertificatePersistentIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validTrustedCertificatePersistentIds, 0);
  objc_storeStrong((id *)&self->_trustedCertificatePersistentIds, 0);
  objc_storeStrong((id *)&self->_automaticRemovalDate, 0);
  objc_storeStrong((id *)&self->_instructorsByIdentifier, 0);
  objc_storeStrong((id *)&self->_courseUser, 0);
  objc_storeStrong((id *)&self->_courseDescription, 0);
  objc_storeStrong((id *)&self->_courseName, 0);

  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

+ (id)new
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  BOOL v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, a1, @"CRKCourse.m", 204, @"%@ is unavailable for %@", v5, a1 object file lineNumber description];

  return 0;
}

- (CRKCourse)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  BOOL v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"CRKCourse.m", 209, @"%@ is unavailable for %@", v5, self object file lineNumber description];

  return 0;
}

@end