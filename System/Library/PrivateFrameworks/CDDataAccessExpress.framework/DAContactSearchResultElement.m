@interface DAContactSearchResultElement
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDAContactSearchResultElement:(id)a3;
- (DAContactSearchResultElement)initWithCoder:(id)a3;
- (NSArray)cuAddresses;
- (NSData)jpegPhoto;
- (NSString)alias;
- (NSString)appleFloor;
- (NSString)buildingName;
- (NSString)city;
- (NSString)company;
- (NSString)country;
- (NSString)department;
- (NSString)displayName;
- (NSString)emailAddress;
- (NSString)faxPhone;
- (NSString)firstName;
- (NSString)homePhone;
- (NSString)homePostalAddress;
- (NSString)iPhone;
- (NSString)identifierOnServer;
- (NSString)imService;
- (NSString)imUsername;
- (NSString)lastName;
- (NSString)mainPhone;
- (NSString)mobilePhone;
- (NSString)office;
- (NSString)pagerNumber;
- (NSString)postalAddress;
- (NSString)preferredUserAddress;
- (NSString)principalPath;
- (NSString)recordName;
- (NSString)serverSource;
- (NSString)state;
- (NSString)street;
- (NSString)title;
- (NSString)uri;
- (NSString)workFaxPhone;
- (NSString)workPhone;
- (NSString)zip;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAlias:(id)a3;
- (void)setAppleFloor:(id)a3;
- (void)setBuildingName:(id)a3;
- (void)setCity:(id)a3;
- (void)setCompany:(id)a3;
- (void)setCountry:(id)a3;
- (void)setCuAddresses:(id)a3;
- (void)setDepartment:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setFaxPhone:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setHomePhone:(id)a3;
- (void)setHomePostalAddress:(id)a3;
- (void)setIPhone:(id)a3;
- (void)setIdentifierOnServer:(id)a3;
- (void)setImService:(id)a3;
- (void)setImUsername:(id)a3;
- (void)setJpegPhoto:(id)a3;
- (void)setLastName:(id)a3;
- (void)setMainPhone:(id)a3;
- (void)setMobilePhone:(id)a3;
- (void)setOffice:(id)a3;
- (void)setPagerNumber:(id)a3;
- (void)setPostalAddress:(id)a3;
- (void)setPreferredUserAddress:(id)a3;
- (void)setPrincipalPath:(id)a3;
- (void)setRecordName:(id)a3;
- (void)setServerSource:(id)a3;
- (void)setState:(id)a3;
- (void)setStreet:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUri:(id)a3;
- (void)setWorkFaxPhone:(id)a3;
- (void)setWorkPhone:(id)a3;
- (void)setZip:(id)a3;
@end

@implementation DAContactSearchResultElement

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DAContactSearchResultElement *)self firstName];
  v6 = [(DAContactSearchResultElement *)self lastName];
  v7 = [(DAContactSearchResultElement *)self displayName];
  v8 = [(DAContactSearchResultElement *)self emailAddress];
  v9 = [v3 stringWithFormat:@"<%@ %p> %@ %@ (%@): %@", v4, self, v5, v6, v7, v8];

  return v9;
}

- (BOOL)isEqualToDAContactSearchResultElement:(id)a3
{
  uint64_t v4 = (DAContactSearchResultElement *)a3;
  if (v4 == self) {
    goto LABEL_69;
  }
  uint64_t v5 = [(DAContactSearchResultElement *)self firstName];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(DAContactSearchResultElement *)self firstName];
    v8 = [(DAContactSearchResultElement *)v4 firstName];
    int v9 = [v7 isEqualToString:v8];

    if (!v9) {
      goto LABEL_68;
    }
  }
  uint64_t v10 = [(DAContactSearchResultElement *)self lastName];
  if (v10)
  {
    v11 = (void *)v10;
    v12 = [(DAContactSearchResultElement *)self lastName];
    v13 = [(DAContactSearchResultElement *)v4 lastName];
    int v14 = [v12 isEqualToString:v13];

    if (!v14) {
      goto LABEL_68;
    }
  }
  uint64_t v15 = [(DAContactSearchResultElement *)self emailAddress];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [(DAContactSearchResultElement *)self emailAddress];
    v18 = [(DAContactSearchResultElement *)v4 emailAddress];
    int v19 = [v17 isEqualToString:v18];

    if (!v19) {
      goto LABEL_68;
    }
  }
  uint64_t v20 = [(DAContactSearchResultElement *)self workPhone];
  if (v20)
  {
    v21 = (void *)v20;
    v22 = [(DAContactSearchResultElement *)self workPhone];
    v23 = [(DAContactSearchResultElement *)v4 workPhone];
    int v24 = [v22 isEqualToString:v23];

    if (!v24) {
      goto LABEL_68;
    }
  }
  uint64_t v25 = [(DAContactSearchResultElement *)self mobilePhone];
  if (v25)
  {
    v26 = (void *)v25;
    v27 = [(DAContactSearchResultElement *)self mobilePhone];
    v28 = [(DAContactSearchResultElement *)v4 mobilePhone];
    int v29 = [v27 isEqualToString:v28];

    if (!v29) {
      goto LABEL_68;
    }
  }
  uint64_t v30 = [(DAContactSearchResultElement *)self company];
  if (v30)
  {
    v31 = (void *)v30;
    v32 = [(DAContactSearchResultElement *)self company];
    v33 = [(DAContactSearchResultElement *)v4 company];
    int v34 = [v32 isEqualToString:v33];

    if (!v34) {
      goto LABEL_68;
    }
  }
  uint64_t v35 = [(DAContactSearchResultElement *)self title];
  if (v35)
  {
    v36 = (void *)v35;
    v37 = [(DAContactSearchResultElement *)self title];
    v38 = [(DAContactSearchResultElement *)v4 title];
    int v39 = [v37 isEqualToString:v38];

    if (!v39) {
      goto LABEL_68;
    }
  }
  uint64_t v40 = [(DAContactSearchResultElement *)self alias];
  if (v40)
  {
    v41 = (void *)v40;
    v42 = [(DAContactSearchResultElement *)self alias];
    v43 = [(DAContactSearchResultElement *)v4 alias];
    int v44 = [v42 isEqualToString:v43];

    if (!v44) {
      goto LABEL_68;
    }
  }
  uint64_t v45 = [(DAContactSearchResultElement *)self homePhone];
  if (v45)
  {
    v46 = (void *)v45;
    v47 = [(DAContactSearchResultElement *)self homePhone];
    v48 = [(DAContactSearchResultElement *)v4 homePhone];
    int v49 = [v47 isEqualToString:v48];

    if (!v49) {
      goto LABEL_68;
    }
  }
  uint64_t v50 = [(DAContactSearchResultElement *)self office];
  if (v50)
  {
    v51 = (void *)v50;
    v52 = [(DAContactSearchResultElement *)self office];
    v53 = [(DAContactSearchResultElement *)v4 office];
    int v54 = [v52 isEqualToString:v53];

    if (!v54) {
      goto LABEL_68;
    }
  }
  uint64_t v55 = [(DAContactSearchResultElement *)self serverSource];
  if (v55)
  {
    v56 = (void *)v55;
    v57 = [(DAContactSearchResultElement *)self serverSource];
    v58 = [(DAContactSearchResultElement *)v4 serverSource];
    int v59 = [v57 isEqualToString:v58];

    if (!v59) {
      goto LABEL_68;
    }
  }
  uint64_t v60 = [(DAContactSearchResultElement *)self recordName];
  if (v60)
  {
    v61 = (void *)v60;
    v62 = [(DAContactSearchResultElement *)self recordName];
    v63 = [(DAContactSearchResultElement *)v4 recordName];
    int v64 = [v62 isEqualToString:v63];

    if (!v64) {
      goto LABEL_68;
    }
  }
  uint64_t v65 = [(DAContactSearchResultElement *)self faxPhone];
  if (v65)
  {
    v66 = (void *)v65;
    v67 = [(DAContactSearchResultElement *)self faxPhone];
    v68 = [(DAContactSearchResultElement *)v4 faxPhone];
    int v69 = [v67 isEqualToString:v68];

    if (!v69) {
      goto LABEL_68;
    }
  }
  uint64_t v70 = [(DAContactSearchResultElement *)self department];
  if (v70)
  {
    v71 = (void *)v70;
    v72 = [(DAContactSearchResultElement *)self department];
    v73 = [(DAContactSearchResultElement *)v4 department];
    int v74 = [v72 isEqualToString:v73];

    if (!v74) {
      goto LABEL_68;
    }
  }
  uint64_t v75 = [(DAContactSearchResultElement *)self street];
  if (v75)
  {
    v76 = (void *)v75;
    v77 = [(DAContactSearchResultElement *)self street];
    v78 = [(DAContactSearchResultElement *)v4 street];
    int v79 = [v77 isEqualToString:v78];

    if (!v79) {
      goto LABEL_68;
    }
  }
  uint64_t v80 = [(DAContactSearchResultElement *)self city];
  if (v80)
  {
    v81 = (void *)v80;
    v82 = [(DAContactSearchResultElement *)self city];
    v83 = [(DAContactSearchResultElement *)v4 city];
    int v84 = [v82 isEqualToString:v83];

    if (!v84) {
      goto LABEL_68;
    }
  }
  uint64_t v85 = [(DAContactSearchResultElement *)self state];
  if (v85)
  {
    v86 = (void *)v85;
    v87 = [(DAContactSearchResultElement *)self state];
    v88 = [(DAContactSearchResultElement *)v4 state];
    int v89 = [v87 isEqualToString:v88];

    if (!v89) {
      goto LABEL_68;
    }
  }
  uint64_t v90 = [(DAContactSearchResultElement *)self zip];
  if (v90)
  {
    v91 = (void *)v90;
    v92 = [(DAContactSearchResultElement *)self zip];
    v93 = [(DAContactSearchResultElement *)v4 zip];
    int v94 = [v92 isEqualToString:v93];

    if (!v94) {
      goto LABEL_68;
    }
  }
  uint64_t v95 = [(DAContactSearchResultElement *)self country];
  if (v95)
  {
    v96 = (void *)v95;
    v97 = [(DAContactSearchResultElement *)self country];
    v98 = [(DAContactSearchResultElement *)v4 country];
    int v99 = [v97 isEqualToString:v98];

    if (!v99) {
      goto LABEL_68;
    }
  }
  uint64_t v100 = [(DAContactSearchResultElement *)self jpegPhoto];
  if (v100)
  {
    v101 = (void *)v100;
    v102 = [(DAContactSearchResultElement *)self jpegPhoto];
    v103 = [(DAContactSearchResultElement *)v4 jpegPhoto];
    int v104 = [v102 isEqualToData:v103];

    if (!v104) {
      goto LABEL_68;
    }
  }
  uint64_t v105 = [(DAContactSearchResultElement *)self imService];
  if (v105)
  {
    v106 = (void *)v105;
    v107 = [(DAContactSearchResultElement *)self imService];
    v108 = [(DAContactSearchResultElement *)v4 imService];
    int v109 = [v107 isEqualToString:v108];

    if (!v109) {
      goto LABEL_68;
    }
  }
  uint64_t v110 = [(DAContactSearchResultElement *)self imUsername];
  if (v110)
  {
    v111 = (void *)v110;
    v112 = [(DAContactSearchResultElement *)self imUsername];
    v113 = [(DAContactSearchResultElement *)v4 imUsername];
    int v114 = [v112 isEqualToString:v113];

    if (!v114) {
      goto LABEL_68;
    }
  }
  uint64_t v115 = [(DAContactSearchResultElement *)self uri];
  if (v115)
  {
    v116 = (void *)v115;
    v117 = [(DAContactSearchResultElement *)self uri];
    v118 = [(DAContactSearchResultElement *)v4 uri];
    int v119 = [v117 isEqualToString:v118];

    if (!v119) {
      goto LABEL_68;
    }
  }
  uint64_t v120 = [(DAContactSearchResultElement *)self buildingName];
  if (v120)
  {
    v121 = (void *)v120;
    v122 = [(DAContactSearchResultElement *)self buildingName];
    v123 = [(DAContactSearchResultElement *)v4 buildingName];
    int v124 = [v122 isEqualToString:v123];

    if (!v124) {
      goto LABEL_68;
    }
  }
  uint64_t v125 = [(DAContactSearchResultElement *)self appleFloor];
  if (v125)
  {
    v126 = (void *)v125;
    v127 = [(DAContactSearchResultElement *)self appleFloor];
    v128 = [(DAContactSearchResultElement *)v4 appleFloor];
    int v129 = [v127 isEqualToString:v128];

    if (!v129) {
      goto LABEL_68;
    }
  }
  uint64_t v130 = [(DAContactSearchResultElement *)self pagerNumber];
  if (v130)
  {
    v131 = (void *)v130;
    v132 = [(DAContactSearchResultElement *)self pagerNumber];
    v133 = [(DAContactSearchResultElement *)v4 pagerNumber];
    int v134 = [v132 isEqualToString:v133];

    if (!v134) {
      goto LABEL_68;
    }
  }
  uint64_t v135 = [(DAContactSearchResultElement *)self postalAddress];
  if (v135)
  {
    v136 = (void *)v135;
    v137 = [(DAContactSearchResultElement *)self postalAddress];
    v138 = [(DAContactSearchResultElement *)v4 postalAddress];
    int v139 = [v137 isEqualToString:v138];

    if (!v139) {
      goto LABEL_68;
    }
  }
  uint64_t v140 = [(DAContactSearchResultElement *)self homePostalAddress];
  if (v140)
  {
    v141 = (void *)v140;
    v142 = [(DAContactSearchResultElement *)self homePostalAddress];
    v143 = [(DAContactSearchResultElement *)v4 homePostalAddress];
    int v144 = [v142 isEqualToString:v143];

    if (!v144) {
      goto LABEL_68;
    }
  }
  uint64_t v145 = [(DAContactSearchResultElement *)self principalPath];
  if (v145)
  {
    v146 = (void *)v145;
    v147 = [(DAContactSearchResultElement *)self principalPath];
    v148 = [(DAContactSearchResultElement *)v4 principalPath];
    int v149 = [v147 isEqualToString:v148];

    if (!v149) {
      goto LABEL_68;
    }
  }
  uint64_t v150 = [(DAContactSearchResultElement *)self iPhone];
  if (v150)
  {
    v151 = (void *)v150;
    v152 = [(DAContactSearchResultElement *)self iPhone];
    v153 = [(DAContactSearchResultElement *)v4 iPhone];
    int v154 = [v152 isEqualToString:v153];

    if (!v154) {
      goto LABEL_68;
    }
  }
  uint64_t v155 = [(DAContactSearchResultElement *)self mainPhone];
  if (v155)
  {
    v156 = (void *)v155;
    v157 = [(DAContactSearchResultElement *)self mainPhone];
    v158 = [(DAContactSearchResultElement *)v4 mainPhone];
    int v159 = [v157 isEqualToString:v158];

    if (!v159) {
      goto LABEL_68;
    }
  }
  uint64_t v160 = [(DAContactSearchResultElement *)self workFaxPhone];
  if (v160)
  {
    v161 = (void *)v160;
    v162 = [(DAContactSearchResultElement *)self workFaxPhone];
    v163 = [(DAContactSearchResultElement *)v4 workFaxPhone];
    int v164 = [v162 isEqualToString:v163];

    if (!v164)
    {
LABEL_68:
      char v169 = 0;
      goto LABEL_70;
    }
  }
  uint64_t v165 = [(DAContactSearchResultElement *)self cuAddresses];
  if (!v165)
  {
LABEL_69:
    char v169 = 1;
    goto LABEL_70;
  }
  v166 = (void *)v165;
  v167 = [(DAContactSearchResultElement *)self cuAddresses];
  v168 = [(DAContactSearchResultElement *)v4 cuAddresses];
  char v169 = [v167 isEqual:v168];

LABEL_70:
  return v169;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DAContactSearchResultElement *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(DAContactSearchResultElement *)self isEqualToDAContactSearchResultElement:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DAContactSearchResultElement *)self displayName];
  [v4 encodeObject:v5 forKey:@"DisplayNameKey"];

  BOOL v6 = [(DAContactSearchResultElement *)self firstName];
  [v4 encodeObject:v6 forKey:@"FirstNameKey"];

  v7 = [(DAContactSearchResultElement *)self lastName];
  [v4 encodeObject:v7 forKey:@"LastNameKey"];

  v8 = [(DAContactSearchResultElement *)self emailAddress];
  [v4 encodeObject:v8 forKey:@"EmailAddressKey"];

  int v9 = [(DAContactSearchResultElement *)self workPhone];
  [v4 encodeObject:v9 forKey:@"WorkPhoneKey"];

  uint64_t v10 = [(DAContactSearchResultElement *)self mobilePhone];
  [v4 encodeObject:v10 forKey:@"MobilePhoneKey"];

  v11 = [(DAContactSearchResultElement *)self company];
  [v4 encodeObject:v11 forKey:@"CompanyKey"];

  v12 = [(DAContactSearchResultElement *)self title];
  [v4 encodeObject:v12 forKey:@"TitleKey"];

  v13 = [(DAContactSearchResultElement *)self alias];
  [v4 encodeObject:v13 forKey:@"AliasKey"];

  int v14 = [(DAContactSearchResultElement *)self homePhone];
  [v4 encodeObject:v14 forKey:@"HomePhoneKey"];

  uint64_t v15 = [(DAContactSearchResultElement *)self office];
  [v4 encodeObject:v15 forKey:@"OfficeKey"];

  v16 = [(DAContactSearchResultElement *)self serverSource];
  [v4 encodeObject:v16 forKey:@"ServerSourceKey"];

  v17 = [(DAContactSearchResultElement *)self recordName];
  [v4 encodeObject:v17 forKey:@"RecordNameKey"];

  v18 = [(DAContactSearchResultElement *)self faxPhone];
  [v4 encodeObject:v18 forKey:@"FaxPhoneKey"];

  int v19 = [(DAContactSearchResultElement *)self department];
  [v4 encodeObject:v19 forKey:@"DepartmentKey"];

  uint64_t v20 = [(DAContactSearchResultElement *)self street];
  [v4 encodeObject:v20 forKey:@"StreetKey"];

  v21 = [(DAContactSearchResultElement *)self city];
  [v4 encodeObject:v21 forKey:@"CityKey"];

  v22 = [(DAContactSearchResultElement *)self state];
  [v4 encodeObject:v22 forKey:@"StateKey"];

  v23 = [(DAContactSearchResultElement *)self zip];
  [v4 encodeObject:v23 forKey:@"ZipKey"];

  int v24 = [(DAContactSearchResultElement *)self country];
  [v4 encodeObject:v24 forKey:@"CountryKey"];

  uint64_t v25 = [(DAContactSearchResultElement *)self jpegPhoto];
  [v4 encodeObject:v25 forKey:@"JpegPhotoKey"];

  v26 = [(DAContactSearchResultElement *)self imService];
  [v4 encodeObject:v26 forKey:@"ImServiceKey"];

  v27 = [(DAContactSearchResultElement *)self imUsername];
  [v4 encodeObject:v27 forKey:@"ImUsernameKey"];

  v28 = [(DAContactSearchResultElement *)self uri];
  [v4 encodeObject:v28 forKey:@"UriKey"];

  int v29 = [(DAContactSearchResultElement *)self buildingName];
  [v4 encodeObject:v29 forKey:@"BuildingNameKey"];

  uint64_t v30 = [(DAContactSearchResultElement *)self appleFloor];
  [v4 encodeObject:v30 forKey:@"AppleFloorKey"];

  v31 = [(DAContactSearchResultElement *)self pagerNumber];
  [v4 encodeObject:v31 forKey:@"PagerNumberKey"];

  v32 = [(DAContactSearchResultElement *)self postalAddress];
  [v4 encodeObject:v32 forKey:@"PostalAddressKey"];

  v33 = [(DAContactSearchResultElement *)self homePostalAddress];
  [v4 encodeObject:v33 forKey:@"HomePostalAddressKey"];

  int v34 = [(DAContactSearchResultElement *)self principalPath];
  [v4 encodeObject:v34 forKey:@"PrincipalPathKey"];

  uint64_t v35 = [(DAContactSearchResultElement *)self preferredUserAddress];
  [v4 encodeObject:v35 forKey:@"PreferredUserAddressKey"];

  v36 = [(DAContactSearchResultElement *)self cuAddresses];
  [v4 encodeObject:v36 forKey:@"CUAddressesKey"];

  v37 = [(DAContactSearchResultElement *)self iPhone];
  [v4 encodeObject:v37 forKey:@"IPhone"];

  v38 = [(DAContactSearchResultElement *)self mainPhone];
  [v4 encodeObject:v38 forKey:@"MainPhone"];

  int v39 = [(DAContactSearchResultElement *)self workFaxPhone];
  [v4 encodeObject:v39 forKey:@"WorkFaxPhone"];

  id v40 = [(DAContactSearchResultElement *)self identifierOnServer];
  [v4 encodeObject:v40 forKey:@"IdentifierOnServerKey"];
}

- (DAContactSearchResultElement)initWithCoder:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)DAContactSearchResultElement;
  uint64_t v5 = [(DAContactSearchResultElement *)&v46 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DisplayNameKey"];
    [(DAContactSearchResultElement *)v5 setDisplayName:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FirstNameKey"];
    [(DAContactSearchResultElement *)v5 setFirstName:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastNameKey"];
    [(DAContactSearchResultElement *)v5 setLastName:v8];

    int v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EmailAddressKey"];
    [(DAContactSearchResultElement *)v5 setEmailAddress:v9];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WorkPhoneKey"];
    [(DAContactSearchResultElement *)v5 setWorkPhone:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MobilePhoneKey"];
    [(DAContactSearchResultElement *)v5 setMobilePhone:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CompanyKey"];
    [(DAContactSearchResultElement *)v5 setCompany:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TitleKey"];
    [(DAContactSearchResultElement *)v5 setTitle:v13];

    int v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AliasKey"];
    [(DAContactSearchResultElement *)v5 setAlias:v14];

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HomePhoneKey"];
    [(DAContactSearchResultElement *)v5 setHomePhone:v15];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OfficeKey"];
    [(DAContactSearchResultElement *)v5 setOffice:v16];

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServerSourceKey"];
    [(DAContactSearchResultElement *)v5 setServerSource:v17];

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecordNameKey"];
    [(DAContactSearchResultElement *)v5 setRecordName:v18];

    int v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FaxPhoneKey"];
    [(DAContactSearchResultElement *)v5 setFaxPhone:v19];

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DepartmentKey"];
    [(DAContactSearchResultElement *)v5 setDepartment:v20];

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StreetKey"];
    [(DAContactSearchResultElement *)v5 setStreet:v21];

    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CityKey"];
    [(DAContactSearchResultElement *)v5 setCity:v22];

    v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StateKey"];
    [(DAContactSearchResultElement *)v5 setState:v23];

    int v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ZipKey"];
    [(DAContactSearchResultElement *)v5 setZip:v24];

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CountryKey"];
    [(DAContactSearchResultElement *)v5 setCountry:v25];

    v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"JpegPhotoKey"];
    [(DAContactSearchResultElement *)v5 setJpegPhoto:v26];

    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ImServiceKey"];
    [(DAContactSearchResultElement *)v5 setImService:v27];

    v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ImUsernameKey"];
    [(DAContactSearchResultElement *)v5 setImUsername:v28];

    int v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UriKey"];
    [(DAContactSearchResultElement *)v5 setUri:v29];

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BuildingNameKey"];
    [(DAContactSearchResultElement *)v5 setBuildingName:v30];

    v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppleFloorKey"];
    [(DAContactSearchResultElement *)v5 setAppleFloor:v31];

    v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PagerNumberKey"];
    [(DAContactSearchResultElement *)v5 setPagerNumber:v32];

    v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PostalAddressKey"];
    [(DAContactSearchResultElement *)v5 setPostalAddress:v33];

    int v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HomePostalAddressKey"];
    [(DAContactSearchResultElement *)v5 setHomePostalAddress:v34];

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrincipalPathKey"];
    [(DAContactSearchResultElement *)v5 setPrincipalPath:v35];

    v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreferredUserAddressKey"];
    [(DAContactSearchResultElement *)v5 setPreferredUserAddress:v36];

    v37 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v38 = objc_opt_class();
    int v39 = objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    id v40 = [v4 decodeObjectOfClasses:v39 forKey:@"CUAddressesKey"];
    [(DAContactSearchResultElement *)v5 setCuAddresses:v40];

    v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IPhone"];
    [(DAContactSearchResultElement *)v5 setIPhone:v41];

    v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MainPhone"];
    [(DAContactSearchResultElement *)v5 setMainPhone:v42];

    v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WorkFaxPhone"];
    [(DAContactSearchResultElement *)v5 setWorkFaxPhone:v43];

    int v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentifierOnServerKey"];
    [(DAContactSearchResultElement *)v5 setIdentifierOnServer:v44];
  }
  return v5;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
}

- (NSString)workPhone
{
  return self->_workPhone;
}

- (void)setWorkPhone:(id)a3
{
}

- (NSString)mobilePhone
{
  return self->_mobilePhone;
}

- (void)setMobilePhone:(id)a3
{
}

- (NSString)company
{
  return self->_company;
}

- (void)setCompany:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)homePhone
{
  return self->_homePhone;
}

- (void)setHomePhone:(id)a3
{
}

- (NSString)alias
{
  return self->_alias;
}

- (void)setAlias:(id)a3
{
}

- (NSString)office
{
  return self->_office;
}

- (void)setOffice:(id)a3
{
}

- (NSString)serverSource
{
  return self->_serverSource;
}

- (void)setServerSource:(id)a3
{
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void)setRecordName:(id)a3
{
}

- (NSString)faxPhone
{
  return self->_faxPhone;
}

- (void)setFaxPhone:(id)a3
{
}

- (NSString)department
{
  return self->_department;
}

- (void)setDepartment:(id)a3
{
}

- (NSString)street
{
  return self->_street;
}

- (void)setStreet:(id)a3
{
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)zip
{
  return self->_zip;
}

- (void)setZip:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
}

- (NSData)jpegPhoto
{
  return self->_jpegPhoto;
}

- (void)setJpegPhoto:(id)a3
{
}

- (NSString)imService
{
  return self->_imService;
}

- (void)setImService:(id)a3
{
}

- (NSString)imUsername
{
  return self->_imUsername;
}

- (void)setImUsername:(id)a3
{
}

- (NSString)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
}

- (NSString)buildingName
{
  return self->_buildingName;
}

- (void)setBuildingName:(id)a3
{
}

- (NSString)appleFloor
{
  return self->_appleFloor;
}

- (void)setAppleFloor:(id)a3
{
}

- (NSString)pagerNumber
{
  return self->_pagerNumber;
}

- (void)setPagerNumber:(id)a3
{
}

- (NSString)postalAddress
{
  return self->_postalAddress;
}

- (void)setPostalAddress:(id)a3
{
}

- (NSString)homePostalAddress
{
  return self->_homePostalAddress;
}

- (void)setHomePostalAddress:(id)a3
{
}

- (NSString)principalPath
{
  return self->_principalPath;
}

- (void)setPrincipalPath:(id)a3
{
}

- (NSString)preferredUserAddress
{
  return self->_preferredUserAddress;
}

- (void)setPreferredUserAddress:(id)a3
{
}

- (NSArray)cuAddresses
{
  return self->_cuAddresses;
}

- (void)setCuAddresses:(id)a3
{
}

- (NSString)iPhone
{
  return self->_iPhone;
}

- (void)setIPhone:(id)a3
{
}

- (NSString)mainPhone
{
  return self->_mainPhone;
}

- (void)setMainPhone:(id)a3
{
}

- (NSString)workFaxPhone
{
  return self->_workFaxPhone;
}

- (void)setWorkFaxPhone:(id)a3
{
}

- (NSString)identifierOnServer
{
  return self->_identifierOnServer;
}

- (void)setIdentifierOnServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierOnServer, 0);
  objc_storeStrong((id *)&self->_workFaxPhone, 0);
  objc_storeStrong((id *)&self->_mainPhone, 0);
  objc_storeStrong((id *)&self->_iPhone, 0);
  objc_storeStrong((id *)&self->_cuAddresses, 0);
  objc_storeStrong((id *)&self->_preferredUserAddress, 0);
  objc_storeStrong((id *)&self->_principalPath, 0);
  objc_storeStrong((id *)&self->_homePostalAddress, 0);
  objc_storeStrong((id *)&self->_postalAddress, 0);
  objc_storeStrong((id *)&self->_pagerNumber, 0);
  objc_storeStrong((id *)&self->_appleFloor, 0);
  objc_storeStrong((id *)&self->_buildingName, 0);
  objc_storeStrong((id *)&self->_uri, 0);
  objc_storeStrong((id *)&self->_imUsername, 0);
  objc_storeStrong((id *)&self->_imService, 0);
  objc_storeStrong((id *)&self->_jpegPhoto, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_zip, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_department, 0);
  objc_storeStrong((id *)&self->_faxPhone, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_serverSource, 0);
  objc_storeStrong((id *)&self->_office, 0);
  objc_storeStrong((id *)&self->_alias, 0);
  objc_storeStrong((id *)&self->_homePhone, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_company, 0);
  objc_storeStrong((id *)&self->_mobilePhone, 0);
  objc_storeStrong((id *)&self->_workPhone, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end