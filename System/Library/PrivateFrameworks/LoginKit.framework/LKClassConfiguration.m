@interface LKClassConfiguration
+ (BOOL)supportsSecureCoding;
- (LKClassConfiguration)initWithCoder:(id)a3;
- (LKClassConfiguration)initWithDictionary:(id)a3;
- (LKClassConfiguration)initWithPropertyList:(id)a3;
- (NSArray)classGroups;
- (NSArray)classes;
- (NSArray)instructors;
- (NSArray)students;
- (NSData)payloadCertificatePersistentID;
- (NSDictionary)classRosterInformationDictionary;
- (NSMutableDictionary)classesByClassGroupName;
- (NSMutableDictionary)classesByClassID;
- (NSMutableDictionary)usersByUsername;
- (NSMutableDictionary)usersWithAppleIDByIdentifier;
- (NSString)schoolName;
- (id)classInfoForClassID:(id)a3;
- (id)classesByClassGroupNameDictionary;
- (id)dictionary;
- (id)studentForStudentIdentifier:(id)a3;
- (id)studentForStudentIdentifier:(id)a3 inClass:(id)a4;
- (id)studentForUsername:(id)a3;
- (id)studentForUsername:(id)a3 inClass:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setClassGroups:(id)a3;
- (void)setClassRosterInformationDictionary:(id)a3;
- (void)setClassesByClassGroupName:(id)a3;
- (void)setClassesByClassID:(id)a3;
- (void)setStudents:(id)a3;
- (void)setUsersByUsername:(id)a3;
- (void)setUsersWithAppleIDByIdentifier:(id)a3;
@end

@implementation LKClassConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LKClassConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)LKClassConfiguration;
  v5 = [(LKClassConfiguration *)&v57 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"schoolName"];
    schoolName = v5->_schoolName;
    v5->_schoolName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payloadCertificatePersistentID"];
    payloadCertificatePersistentID = v5->_payloadCertificatePersistentID;
    v5->_payloadCertificatePersistentID = (NSData *)v8;

    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"classes"];
    classes = v5->_classes;
    v5->_classes = (NSArray *)v13;

    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);

    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"classGroups"];
    classGroups = v5->_classGroups;
    v5->_classGroups = (NSArray *)v18;

    v20 = (void *)MEMORY[0x263EFFA08];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);

    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"students"];
    students = v5->_students;
    v5->_students = (NSArray *)v23;

    uint64_t v25 = [v4 decodeObjectOfClasses:v22 forKey:@"instructors"];
    instructors = v5->_instructors;
    v5->_instructors = (NSArray *)v25;

    v27 = (void *)MEMORY[0x263EFFA08];
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    v30 = objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);

    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"classesByClassID"];
    classesByClassID = v5->_classesByClassID;
    v5->_classesByClassID = (NSMutableDictionary *)v31;

    v33 = (void *)MEMORY[0x263EFFA08];
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    v36 = objc_msgSend(v33, "setWithObjects:", v34, v35, objc_opt_class(), 0);

    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"usersWithAppleIDByIdentifier"];
    usersWithAppleIDByIdentifier = v5->_usersWithAppleIDByIdentifier;
    v5->_usersWithAppleIDByIdentifier = (NSMutableDictionary *)v37;

    uint64_t v39 = [v4 decodeObjectOfClasses:v36 forKey:@"usersByUsername"];
    usersByUsername = v5->_usersByUsername;
    v5->_usersByUsername = (NSMutableDictionary *)v39;

    v41 = (void *)MEMORY[0x263EFFA08];
    uint64_t v42 = objc_opt_class();
    uint64_t v43 = objc_opt_class();
    uint64_t v44 = objc_opt_class();
    v45 = objc_msgSend(v41, "setWithObjects:", v42, v43, v44, objc_opt_class(), 0);

    uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:@"classesByClassGroupName"];
    classesByClassGroupName = v5->_classesByClassGroupName;
    v5->_classesByClassGroupName = (NSMutableDictionary *)v46;

    v48 = (void *)MEMORY[0x263EFFA08];
    uint64_t v49 = objc_opt_class();
    uint64_t v50 = objc_opt_class();
    uint64_t v51 = objc_opt_class();
    uint64_t v52 = objc_opt_class();
    v53 = objc_msgSend(v48, "setWithObjects:", v49, v50, v51, v52, objc_opt_class(), 0);

    uint64_t v54 = [v4 decodeObjectOfClasses:v53 forKey:@"classRosterInformationDictionary"];
    classRosterInformationDictionary = v5->_classRosterInformationDictionary;
    v5->_classRosterInformationDictionary = (NSDictionary *)v54;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  schoolName = self->_schoolName;
  id v5 = a3;
  [v5 encodeObject:schoolName forKey:@"schoolName"];
  [v5 encodeObject:self->_payloadCertificatePersistentID forKey:@"payloadCertificatePersistentID"];
  [v5 encodeObject:self->_classes forKey:@"classes"];
  [v5 encodeObject:self->_classGroups forKey:@"classGroups"];
  [v5 encodeObject:self->_students forKey:@"students"];
  [v5 encodeObject:self->_instructors forKey:@"instructors"];
  [v5 encodeObject:self->_classesByClassID forKey:@"classesByClassID"];
  [v5 encodeObject:self->_usersWithAppleIDByIdentifier forKey:@"usersWithAppleIDByIdentifier"];
  [v5 encodeObject:self->_usersByUsername forKey:@"usersByUsername"];
  [v5 encodeObject:self->_classesByClassGroupName forKey:@"classesByClassGroupName"];
  [v5 encodeObject:self->_classRosterInformationDictionary forKey:@"classRosterInformationDictionary"];
}

- (LKClassConfiguration)initWithDictionary:(id)a3
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  id v5 = a3;
  LKRegisterLoginKitLogging();
  v103.receiver = self;
  v103.super_class = (Class)LKClassConfiguration;
  uint64_t v6 = [(LKClassConfiguration *)&v103 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_classRosterInformationDictionary, a3);
    uint64_t v8 = [v5 objectForKeyedSubscript:@"OrganizationName"];
    schoolName = v7->_schoolName;
    v7->_schoolName = (NSString *)v8;

    uint64_t v10 = [v5 objectForKeyedSubscript:@"PayloadCertificatePersistentID"];
    payloadCertificatePersistentID = v7->_payloadCertificatePersistentID;
    v7->_payloadCertificatePersistentID = (NSData *)v10;

    uint64_t v12 = objc_opt_new();
    classesByClassGroupName = v7->_classesByClassGroupName;
    v7->_classesByClassGroupName = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    classesByClassID = v7->_classesByClassID;
    v7->_classesByClassID = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_opt_new();
    usersWithAppleIDByIdentifier = v7->_usersWithAppleIDByIdentifier;
    v7->_usersWithAppleIDByIdentifier = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    usersByUsername = v7->_usersByUsername;
    v7->_usersByUsername = (NSMutableDictionary *)v18;

    v86 = objc_opt_new();
    v84 = objc_opt_new();
    v80 = objc_opt_new();
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    v79 = v5;
    v20 = [v5 objectForKeyedSubscript:@"Users"];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v99 objects:v111 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v100;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v100 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = +[LKUser userFromDictionary:*(void *)(*((void *)&v99 + 1) + 8 * v24)];
          v26 = [v25 identifier];
          [v86 setObject:v25 forKeyedSubscript:v26];

          v27 = [v25 username];

          if (v27)
          {
            uint64_t v28 = v7->_usersByUsername;
            uint64_t v29 = [v25 username];
            [(NSMutableDictionary *)v28 setObject:v25 forKeyedSubscript:v29];

            v30 = [v25 identifier];

            if (v30)
            {
              uint64_t v31 = v7->_usersWithAppleIDByIdentifier;
              v32 = [v25 identifier];
              [(NSMutableDictionary *)v31 setObject:v25 forKeyedSubscript:v32];
            }
          }
          else
          {
            v33 = (void *)LKLogParsing;
            if (os_log_type_enabled((os_log_t)LKLogParsing, OS_LOG_TYPE_DEBUG)) {
              -[LKClassConfiguration initWithDictionary:](&v109, v33, v25, &v110);
            }
          }
          [v84 addObject:v25];

          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v99 objects:v111 count:16];
      }
      while (v22);
    }

    obuint64_t j = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    uint64_t v34 = [v79 objectForKeyedSubscript:@"Groups"];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v95 objects:v108 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v96;
      do
      {
        uint64_t v38 = 0;
        do
        {
          if (*(void *)v96 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = [[LKClass alloc] initWithClassDictionary:*(void *)(*((void *)&v95 + 1) + 8 * v38) usersByUserIdentifier:v86];
          uint64_t v40 = [(LKClass *)v39 classID];
          if (v40
            && (v41 = (void *)v40,
                [(LKClass *)v39 students],
                uint64_t v42 = objc_claimAutoreleasedReturnValue(),
                uint64_t v43 = [v42 count],
                v42,
                v41,
                v43))
          {
            uint64_t v44 = v7->_classesByClassID;
            v45 = [(LKClass *)v39 classID];
            [(NSMutableDictionary *)v44 setObject:v39 forKeyedSubscript:v45];

            [obj addObject:v39];
            uint64_t v46 = [(LKClass *)v39 instructors];

            if (v46)
            {
              v47 = [(LKClass *)v39 instructors];
              [v80 addObjectsFromArray:v47];
            }
          }
          else
          {
            v48 = (void *)LKLogParsing;
            if (os_log_type_enabled((os_log_t)LKLogParsing, OS_LOG_TYPE_DEBUG)) {
              -[LKClassConfiguration initWithDictionary:](&v106, v48, v39, &v107);
            }
          }

          ++v38;
        }
        while (v36 != v38);
        uint64_t v36 = [v34 countByEnumeratingWithState:&v95 objects:v108 count:16];
      }
      while (v36);
    }

    uint64_t v49 = [(NSMutableDictionary *)v7->_usersWithAppleIDByIdentifier allValues];
    students = v7->_students;
    v7->_students = (NSArray *)v49;

    p_classes = (id *)&v7->_classes;
    objc_storeStrong((id *)&v7->_classes, obj);
    uint64_t v51 = [v80 allObjects];
    instructors = v7->_instructors;
    v7->_instructors = (NSArray *)v51;

    v53 = (void *)[(NSMutableDictionary *)v7->_classesByClassID mutableCopy];
    v85 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v82 = [v79 objectForKeyedSubscript:@"Departments"];
    uint64_t v54 = [v82 countByEnumeratingWithState:&v91 objects:v105 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v83 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v55; ++i)
        {
          if (*(void *)v92 != v83) {
            objc_enumerationMutation(v82);
          }
          objc_super v57 = [[LKClassGroup alloc] initWithClassGroupDictionary:*(void *)(*((void *)&v91 + 1) + 8 * i) classesDictionaryByClassID:v7->_classesByClassID];
          v58 = [(LKClassGroup *)v57 classGroupName];

          if (v58)
          {
            v59 = [(LKClassGroup *)v57 classes];
            v60 = v7;
            v61 = v7->_classesByClassGroupName;
            v62 = [(LKClassGroup *)v57 classGroupName];
            [(NSMutableDictionary *)v61 setObject:v59 forKeyedSubscript:v62];

            long long v89 = 0u;
            long long v90 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            v63 = [(LKClassGroup *)v57 classes];
            uint64_t v64 = [v63 countByEnumeratingWithState:&v87 objects:v104 count:16];
            if (v64)
            {
              uint64_t v65 = v64;
              uint64_t v66 = *(void *)v88;
              do
              {
                for (uint64_t j = 0; j != v65; ++j)
                {
                  if (*(void *)v88 != v66) {
                    objc_enumerationMutation(v63);
                  }
                  v68 = [*(id *)(*((void *)&v87 + 1) + 8 * j) classID];
                  [v53 removeObjectForKey:v68];
                }
                uint64_t v65 = [v63 countByEnumeratingWithState:&v87 objects:v104 count:16];
              }
              while (v65);
            }

            v7 = v60;
          }
          [(NSArray *)v85 addObject:v57];
        }
        uint64_t v55 = [v82 countByEnumeratingWithState:&v91 objects:v105 count:16];
      }
      while (v55);
    }

    v69 = [v53 allValues];
    if ([v69 count])
    {
      v70 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v71 = [v70 localizedStringForKey:@"Other Classes" value:&stru_26D490708 table:0];

      uint64_t v72 = [v69 count];
      if (v72 == [*p_classes count])
      {
        v73 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v74 = [v73 localizedStringForKey:@"All Classes" value:&stru_26D490708 table:0];

        v71 = (void *)v74;
      }
      [(NSMutableDictionary *)v7->_classesByClassGroupName setObject:v69 forKeyedSubscript:v71];
      v75 = [[LKClassGroup alloc] initWithGroupName:v71 classes:v69];
      [(NSArray *)v85 addObject:v75];
    }
    classGroups = v7->_classGroups;
    v7->_classGroups = v85;

    id v5 = v79;
  }

  return v7;
}

- (id)dictionary
{
  return self->_classRosterInformationDictionary;
}

- (LKClassConfiguration)initWithPropertyList:(id)a3
{
  id v4 = NSDictionary;
  id v5 = (void *)MEMORY[0x263F086E0];
  id v6 = a3;
  v7 = [v5 mainBundle];
  uint64_t v8 = [v7 pathForResource:v6 ofType:@"plist"];

  v9 = [v4 dictionaryWithContentsOfFile:v8];

  if (v9)
  {
    self = [(LKClassConfiguration *)self initWithDictionary:v9];
    uint64_t v10 = self;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)classInfoForClassID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_classesByClassID objectForKeyedSubscript:a3];
}

- (id)studentForStudentIdentifier:(id)a3 inClass:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(LKClassConfiguration *)self usersWithAppleIDByIdentifier];
  v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = objc_msgSend(v7, "students", 0);
    id v11 = (id)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) identifier];
          v15 = [v9 identifier];
          int v16 = [v14 isEqualToString:v15];

          if (v16)
          {
            id v11 = v9;
            goto LABEL_12;
          }
        }
        id v11 = (id)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)studentForStudentIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(LKClassConfiguration *)self usersWithAppleIDByIdentifier];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)studentForUsername:(id)a3 inClass:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(LKClassConfiguration *)self usersByUsername];
  v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = objc_msgSend(v7, "students", 0);
    id v11 = (id)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) username];
          v15 = [v9 username];
          int v16 = [v14 isEqualToString:v15];

          if (v16)
          {
            id v11 = v9;
            goto LABEL_12;
          }
        }
        id v11 = (id)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)studentForUsername:(id)a3
{
  id v4 = a3;
  id v5 = [(LKClassConfiguration *)self usersByUsername];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)classesByClassGroupNameDictionary
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(NSMutableDictionary *)self->_classesByClassGroupName allKeys];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [LKClasses alloc];
        uint64_t v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_classesByClassGroupName, "objectForKeyedSubscript:", v10, (void)v15);
        uint64_t v13 = [(LKClasses *)v11 initWithClassArray:v12];
        [v4 setObject:v13 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSString)schoolName
{
  return self->_schoolName;
}

- (NSArray)classes
{
  return self->_classes;
}

- (NSArray)students
{
  return self->_students;
}

- (void)setStudents:(id)a3
{
}

- (NSData)payloadCertificatePersistentID
{
  return self->_payloadCertificatePersistentID;
}

- (NSArray)classGroups
{
  return self->_classGroups;
}

- (void)setClassGroups:(id)a3
{
}

- (NSArray)instructors
{
  return self->_instructors;
}

- (NSMutableDictionary)classesByClassID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setClassesByClassID:(id)a3
{
}

- (NSMutableDictionary)usersWithAppleIDByIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUsersWithAppleIDByIdentifier:(id)a3
{
}

- (NSMutableDictionary)usersByUsername
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUsersByUsername:(id)a3
{
}

- (NSMutableDictionary)classesByClassGroupName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setClassesByClassGroupName:(id)a3
{
}

- (NSDictionary)classRosterInformationDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setClassRosterInformationDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classRosterInformationDictionary, 0);
  objc_storeStrong((id *)&self->_classesByClassGroupName, 0);
  objc_storeStrong((id *)&self->_usersByUsername, 0);
  objc_storeStrong((id *)&self->_usersWithAppleIDByIdentifier, 0);
  objc_storeStrong((id *)&self->_classesByClassID, 0);
  objc_storeStrong((id *)&self->_instructors, 0);
  objc_storeStrong((id *)&self->_classGroups, 0);
  objc_storeStrong((id *)&self->_payloadCertificatePersistentID, 0);
  objc_storeStrong((id *)&self->_students, 0);
  objc_storeStrong((id *)&self->_classes, 0);
  objc_storeStrong((id *)&self->_schoolName, 0);
}

- (void)initWithDictionary:(void *)a3 .cold.1(_DWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = [a3 classID];
  *a1 = 138477827;
  *a4 = v8;
  OUTLINED_FUNCTION_0_0(&dword_2221A9000, v9, v10, "Ignoring the class with ID: %{private}@ Reason: No students in the class");
}

- (void)initWithDictionary:(void *)a3 .cold.2(_DWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = [a3 identifier];
  *a1 = 138477827;
  *a4 = v8;
  OUTLINED_FUNCTION_0_0(&dword_2221A9000, v9, v10, "The user with ID: %{private}@ will not be visible in any class because of no Apple ID");
}

@end