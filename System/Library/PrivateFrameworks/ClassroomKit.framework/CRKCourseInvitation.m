@interface CRKCourseInvitation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CRKCourseInvitation)initWithCoder:(id)a3;
- (CRKCourseInvitation)initWithCourseIdentifier:(id)a3 courseName:(id)a4 courseDescription:(id)a5 courseMascotType:(unint64_t)a6 courseColorType:(unint64_t)a7 instructorName:(id)a8 anchorCertificateDatas:(id)a9;
- (CRKCourseInvitation)initWithCourseIdentifier:(id)a3 courseName:(id)a4 courseDescription:(id)a5 courseMascotType:(unint64_t)a6 courseColorType:(unint64_t)a7 instructorName:(id)a8 anchorCertificates:(id)a9;
- (CRKCourseInvitation)initWithCourseIdentifier:(id)a3 courseName:(id)a4 courseDescription:(id)a5 courseMascotType:(unint64_t)a6 courseColorType:(unint64_t)a7 instructorName:(id)a8 instructorImageData:(id)a9 anchorCertificateDatas:(id)a10;
- (CRKCourseInvitation)initWithCourseIdentifier:(id)a3 courseName:(id)a4 courseDescription:(id)a5 courseMascotType:(unint64_t)a6 courseColorType:(unint64_t)a7 instructorName:(id)a8 instructorImageData:(id)a9 anchorCertificates:(id)a10;
- (CRKCourseInvitation)initWithCourseIdentifier:(id)a3 courseName:(id)a4 courseDescription:(id)a5 instructorName:(id)a6 anchorCertificates:(id)a7;
- (CRKCourseInvitation)initWithCourseIdentifier:(id)a3 courseName:(id)a4 courseDescription:(id)a5 instructorName:(id)a6 instructorImageData:(id)a7 anchorCertificates:(id)a8;
- (DMFControlGroupIdentifier)courseIdentifier;
- (NSArray)anchorCertificateDatas;
- (NSData)instructorImageData;
- (NSString)courseDescription;
- (NSString)courseName;
- (NSString)instructorName;
- (id)description;
- (unint64_t)courseColorType;
- (unint64_t)courseMascotType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRKCourseInvitation

- (CRKCourseInvitation)initWithCourseIdentifier:(id)a3 courseName:(id)a4 courseDescription:(id)a5 instructorName:(id)a6 anchorCertificates:(id)a7
{
  return [(CRKCourseInvitation *)self initWithCourseIdentifier:a3 courseName:a4 courseDescription:a5 instructorName:a6 instructorImageData:0 anchorCertificates:a7];
}

- (CRKCourseInvitation)initWithCourseIdentifier:(id)a3 courseName:(id)a4 courseDescription:(id)a5 instructorName:(id)a6 instructorImageData:(id)a7 anchorCertificates:(id)a8
{
  return [(CRKCourseInvitation *)self initWithCourseIdentifier:a3 courseName:a4 courseDescription:a5 courseMascotType:0 courseColorType:0 instructorName:a6 instructorImageData:a7 anchorCertificates:a8];
}

- (CRKCourseInvitation)initWithCourseIdentifier:(id)a3 courseName:(id)a4 courseDescription:(id)a5 courseMascotType:(unint64_t)a6 courseColorType:(unint64_t)a7 instructorName:(id)a8 anchorCertificates:(id)a9
{
  return [(CRKCourseInvitation *)self initWithCourseIdentifier:a3 courseName:a4 courseDescription:a5 courseMascotType:a6 courseColorType:a7 instructorName:a8 instructorImageData:0 anchorCertificates:a9];
}

- (CRKCourseInvitation)initWithCourseIdentifier:(id)a3 courseName:(id)a4 courseDescription:(id)a5 courseMascotType:(unint64_t)a6 courseColorType:(unint64_t)a7 instructorName:(id)a8 instructorImageData:(id)a9 anchorCertificates:(id)a10
{
  id v17 = a9;
  id v18 = a8;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = objc_msgSend(a10, "crk_mapUsingBlock:", &__block_literal_global_31);
  v23 = [(CRKCourseInvitation *)self initWithCourseIdentifier:v21 courseName:v20 courseDescription:v19 courseMascotType:a6 courseColorType:a7 instructorName:v18 instructorImageData:v17 anchorCertificateDatas:v22];

  return v23;
}

id __164__CRKCourseInvitation_initWithCourseIdentifier_courseName_courseDescription_courseMascotType_courseColorType_instructorName_instructorImageData_anchorCertificates___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[CRKConcreteCertificate alloc] initWithCertificate:v2];

  v4 = [(CRKConcreteCertificate *)v3 dataRepresentation];

  return v4;
}

- (CRKCourseInvitation)initWithCourseIdentifier:(id)a3 courseName:(id)a4 courseDescription:(id)a5 courseMascotType:(unint64_t)a6 courseColorType:(unint64_t)a7 instructorName:(id)a8 anchorCertificateDatas:(id)a9
{
  return [(CRKCourseInvitation *)self initWithCourseIdentifier:a3 courseName:a4 courseDescription:a5 courseMascotType:a6 courseColorType:a7 instructorName:a8 instructorImageData:0 anchorCertificateDatas:a9];
}

- (CRKCourseInvitation)initWithCourseIdentifier:(id)a3 courseName:(id)a4 courseDescription:(id)a5 courseMascotType:(unint64_t)a6 courseColorType:(unint64_t)a7 instructorName:(id)a8 instructorImageData:(id)a9 anchorCertificateDatas:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  v36.receiver = self;
  v36.super_class = (Class)CRKCourseInvitation;
  v22 = [(CRKCourseInvitation *)&v36 init];
  if (v22)
  {
    uint64_t v23 = [v16 copy];
    courseIdentifier = v22->_courseIdentifier;
    v22->_courseIdentifier = (DMFControlGroupIdentifier *)v23;

    uint64_t v25 = [v17 copy];
    courseName = v22->_courseName;
    v22->_courseName = (NSString *)v25;

    uint64_t v27 = [v18 copy];
    courseDescription = v22->_courseDescription;
    v22->_courseDescription = (NSString *)v27;

    v22->_courseMascotType = a6;
    v22->_courseColorType = a7;
    uint64_t v29 = [v19 copy];
    instructorName = v22->_instructorName;
    v22->_instructorName = (NSString *)v29;

    uint64_t v31 = [v20 copy];
    instructorImageData = v22->_instructorImageData;
    v22->_instructorImageData = (NSData *)v31;

    uint64_t v33 = [v21 copy];
    anchorCertificateDatas = v22->_anchorCertificateDatas;
    v22->_anchorCertificateDatas = (NSArray *)v33;
  }
  return v22;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CRKCourseInvitation *)self courseIdentifier];
  v6 = [v5 stringValue];
  v7 = [(CRKCourseInvitation *)self courseName];
  v8 = [(CRKCourseInvitation *)self instructorName];
  v9 = [v3 stringWithFormat:@"<%@: %p { identifier = %@, name = %@, instructor = %@ }>", v4, self, v6, v7, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKCourseInvitation)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CRKCourseInvitation;
  v5 = [(CRKCourseInvitation *)&v29 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"courseIdentifier"];
    courseIdentifier = v5->_courseIdentifier;
    v5->_courseIdentifier = (DMFControlGroupIdentifier *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"courseName"];
    courseName = v5->_courseName;
    v5->_courseName = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"courseDescription"];
    courseDescription = v5->_courseDescription;
    v5->_courseDescription = (NSString *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"courseMascotType"];
    v5->_courseMascotType = [v15 unsignedIntegerValue];

    id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"courseColorType"];
    v5->_courseColorType = [v16 unsignedIntegerValue];

    id v17 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"instructorName"];
    instructorName = v5->_instructorName;
    v5->_instructorName = (NSString *)v18;

    id v20 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"instructorImageData"];
    instructorImageData = v5->_instructorImageData;
    v5->_instructorImageData = (NSData *)v21;

    uint64_t v23 = (void *)MEMORY[0x263EFFA08];
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"anchorCertificateDatas"];
    anchorCertificateDatas = v5->_anchorCertificateDatas;
    v5->_anchorCertificateDatas = (NSArray *)v26;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CRKCourseInvitation *)self courseIdentifier];
  [v4 encodeObject:v5 forKey:@"courseIdentifier"];

  v6 = [(CRKCourseInvitation *)self courseName];
  [v4 encodeObject:v6 forKey:@"courseName"];

  uint64_t v7 = [(CRKCourseInvitation *)self courseDescription];
  [v4 encodeObject:v7 forKey:@"courseDescription"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKCourseInvitation courseMascotType](self, "courseMascotType"));
  [v4 encodeObject:v8 forKey:@"courseMascotType"];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKCourseInvitation courseColorType](self, "courseColorType"));
  [v4 encodeObject:v9 forKey:@"courseColorType"];

  uint64_t v10 = [(CRKCourseInvitation *)self instructorName];
  [v4 encodeObject:v10 forKey:@"instructorName"];

  v11 = [(CRKCourseInvitation *)self instructorImageData];
  [v4 encodeObject:v11 forKey:@"instructorImageData"];

  id v12 = [(CRKCourseInvitation *)self anchorCertificateDatas];
  [v4 encodeObject:v12 forKey:@"anchorCertificateDatas"];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(@"courseIdentifier, courseName, courseDescription, courseMascotType, courseColorType, instructorName, instructorImageData, anchorCertificateDatas", "componentsSeparatedByString:", @",");
  v6 = (void *)[v5 mutableCopy];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_7;
  v28[3] = &unk_2646F3750;
  id v7 = v6;
  id v29 = v7;
  [v7 enumerateObjectsUsingBlock:v28];

  v8 = self;
  v9 = (CRKCourseInvitation *)v4;
  id v10 = v7;
  if (v8 == v9)
  {
    BOOL v21 = 1;
  }
  else if ([(CRKCourseInvitation *)v9 isMemberOfClass:objc_opt_class()])
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
          id v17 = v9;
          uint64_t v18 = [(CRKCourseInvitation *)v8 valueForKey:v16];
          uint64_t v19 = [(CRKCourseInvitation *)v17 valueForKey:v16];

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

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (NSString)courseName
{
  return self->_courseName;
}

- (NSString)courseDescription
{
  return self->_courseDescription;
}

- (unint64_t)courseMascotType
{
  return self->_courseMascotType;
}

- (unint64_t)courseColorType
{
  return self->_courseColorType;
}

- (NSString)instructorName
{
  return self->_instructorName;
}

- (NSData)instructorImageData
{
  return self->_instructorImageData;
}

- (NSArray)anchorCertificateDatas
{
  return self->_anchorCertificateDatas;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorCertificateDatas, 0);
  objc_storeStrong((id *)&self->_instructorImageData, 0);
  objc_storeStrong((id *)&self->_instructorName, 0);
  objc_storeStrong((id *)&self->_courseDescription, 0);
  objc_storeStrong((id *)&self->_courseName, 0);

  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

@end