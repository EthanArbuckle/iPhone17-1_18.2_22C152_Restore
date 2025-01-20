@interface HMDWidgetFetchSpecification
+ (NSSet)allHomeLockScreenWidgetKinds;
+ (NSSet)allOtherHomesSingleAccessorySecurityFetchSpecifications;
+ (NSSet)lightsFetchSpecifications;
+ (NSSet)mainHomeSecurityFetchSpecifications;
- (HMDWidgetFetchSpecification)initWithName:(id)a3 serviceTypes:(id)a4 associatedServiceTypes:(id)a5 characteristicTypes:(id)a6 affectedWidgetKinds:(id)a7;
- (NSSet)affectedWidgetKinds;
- (NSSet)associatedServiceTypes;
- (NSSet)characteristicTypes;
- (NSSet)serviceTypes;
- (NSString)name;
- (id)attributeDescriptions;
@end

@implementation HMDWidgetFetchSpecification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_affectedWidgetKinds, 0);
  objc_storeStrong((id *)&self->_characteristicTypes, 0);
  objc_storeStrong((id *)&self->_associatedServiceTypes, 0);
  objc_storeStrong((id *)&self->_serviceTypes, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSSet)affectedWidgetKinds
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (NSSet)characteristicTypes
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (NSSet)associatedServiceTypes
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)serviceTypes
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDWidgetFetchSpecification *)self serviceTypes];
  v5 = (void *)[v3 initWithName:@"Service Types" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDWidgetFetchSpecification *)self associatedServiceTypes];
  v8 = (void *)[v6 initWithName:@"Associated Service Types" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMDWidgetFetchSpecification *)self characteristicTypes];
  v11 = (void *)[v9 initWithName:@"Characteristic Types" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = [(HMDWidgetFetchSpecification *)self affectedWidgetKinds];
  v14 = (void *)[v12 initWithName:@"Affected Widget Kinds" value:v13];
  v17[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  return v15;
}

- (HMDWidgetFetchSpecification)initWithName:(id)a3 serviceTypes:(id)a4 associatedServiceTypes:(id)a5 characteristicTypes:(id)a6 affectedWidgetKinds:(id)a7
{
  v28.receiver = self;
  v28.super_class = (Class)HMDWidgetFetchSpecification;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(HMDWidgetFetchSpecification *)&v28 init];
  uint64_t v17 = objc_msgSend(v15, "copy", v28.receiver, v28.super_class);

  name = v16->_name;
  v16->_name = (NSString *)v17;

  uint64_t v19 = [v14 copy];
  serviceTypes = v16->_serviceTypes;
  v16->_serviceTypes = (NSSet *)v19;

  uint64_t v21 = [v13 copy];
  associatedServiceTypes = v16->_associatedServiceTypes;
  v16->_associatedServiceTypes = (NSSet *)v21;

  uint64_t v23 = [v12 copy];
  characteristicTypes = v16->_characteristicTypes;
  v16->_characteristicTypes = (NSSet *)v23;

  uint64_t v25 = [v11 copy];
  affectedWidgetKinds = v16->_affectedWidgetKinds;
  v16->_affectedWidgetKinds = (NSSet *)v25;

  return v16;
}

+ (NSSet)allOtherHomesSingleAccessorySecurityFetchSpecifications
{
  v22[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CAD0] setWithObject:@"com.apple.Home.widget.security.singleAccessory"];
  v18 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [HMDWidgetFetchSpecification alloc];
  uint64_t v21 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2DE38]];
  v20 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v19 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2CE90]];
  uint64_t v17 = [(HMDWidgetFetchSpecification *)v3 initWithName:@"Garage Door Openers" serviceTypes:v21 associatedServiceTypes:v20 characteristicTypes:v19 affectedWidgetKinds:v2];
  v22[0] = v17;
  v4 = [HMDWidgetFetchSpecification alloc];
  v16 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2DE88]];
  v5 = [MEMORY[0x1E4F1CAD0] set];
  id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2CEB0]];
  v7 = [(HMDWidgetFetchSpecification *)v4 initWithName:@"Locks" serviceTypes:v16 associatedServiceTypes:v5 characteristicTypes:v6 affectedWidgetKinds:v2];
  v22[1] = v7;
  v8 = [HMDWidgetFetchSpecification alloc];
  id v9 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2DEB0]];
  v10 = [MEMORY[0x1E4F1CAD0] set];
  id v11 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2CED0]];
  id v12 = [(HMDWidgetFetchSpecification *)v8 initWithName:@"Security Systems" serviceTypes:v9 associatedServiceTypes:v10 characteristicTypes:v11 affectedWidgetKinds:v2];
  v22[2] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  id v14 = [v18 setWithArray:v13];

  return (NSSet *)v14;
}

+ (NSSet)mainHomeSecurityFetchSpecifications
{
  v48[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v48[0] = @"com.apple.Home.widget.security.category";
  v48[1] = @"com.apple.Home.widget.summary.category";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  v38 = [v2 setWithArray:v3];

  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v47[0] = @"com.apple.Home.widget.security.category";
  v47[1] = @"com.apple.Home.widget.summary.category";
  v47[2] = @"com.apple.Home.widget.security.singleAccessory";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:3];
  id v6 = [v4 setWithArray:v5];

  id v36 = (id)MEMORY[0x1E4F1CAD0];
  v7 = [HMDWidgetFetchSpecification alloc];
  uint64_t v8 = *MEMORY[0x1E4F2DE38];
  v43 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2DE38]];
  v42 = [MEMORY[0x1E4F1CAD0] set];
  v41 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2CE90]];
  v40 = [(HMDWidgetFetchSpecification *)v7 initWithName:@"Garage Door Openers" serviceTypes:v43 associatedServiceTypes:v42 characteristicTypes:v41 affectedWidgetKinds:v6];
  v46[0] = v40;
  id v9 = [HMDWidgetFetchSpecification alloc];
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = *MEMORY[0x1E4F2DF28];
  v45[0] = *MEMORY[0x1E4F2DE18];
  uint64_t v11 = v45[0];
  v45[1] = v12;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  v35 = [v10 setWithArray:v39];
  v34 = [MEMORY[0x1E4F1CAD0] set];
  v33 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2CF60]];
  v32 = [(HMDWidgetFetchSpecification *)v9 initWithName:@"Motorized Doors & Windows" serviceTypes:v35 associatedServiceTypes:v34 characteristicTypes:v33 affectedWidgetKinds:v38];
  v46[1] = v32;
  id v13 = [HMDWidgetFetchSpecification alloc];
  v30 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2DE08]];
  id v14 = (void *)MEMORY[0x1E4F1CAD0];
  v44[0] = v8;
  v44[1] = v11;
  v44[2] = v12;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
  v29 = [v14 setWithArray:v31];
  objc_super v28 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2CE88]];
  v27 = [(HMDWidgetFetchSpecification *)v13 initWithName:@"Contact Sensors w/ associated Garage Doors, Doors, or Windows" serviceTypes:v30 associatedServiceTypes:v29 characteristicTypes:v28 affectedWidgetKinds:v6];
  v46[2] = v27;
  id v15 = [HMDWidgetFetchSpecification alloc];
  v16 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2DE88]];
  uint64_t v17 = [MEMORY[0x1E4F1CAD0] set];
  v18 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2CEB0]];
  uint64_t v19 = [(HMDWidgetFetchSpecification *)v15 initWithName:@"Locks" serviceTypes:v16 associatedServiceTypes:v17 characteristicTypes:v18 affectedWidgetKinds:v6];
  v46[3] = v19;
  v20 = [HMDWidgetFetchSpecification alloc];
  uint64_t v21 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2DEB0]];
  v22 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v23 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2CED0]];
  v24 = [(HMDWidgetFetchSpecification *)v20 initWithName:@"Security Systems" serviceTypes:v21 associatedServiceTypes:v22 characteristicTypes:v23 affectedWidgetKinds:v6];
  v46[4] = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:5];
  id v37 = [v36 setWithArray:v25];

  return (NSSet *)v37;
}

+ (NSSet)lightsFetchSpecifications
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v26[0] = @"com.apple.Home.widget.lights.category";
  v26[1] = @"com.apple.Home.widget.summary.category";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v4 = [v2 setWithArray:v3];

  uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = [HMDWidgetFetchSpecification alloc];
  uint64_t v6 = *MEMORY[0x1E4F2DE78];
  uint64_t v23 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2DE78]];
  v22 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v7 = *MEMORY[0x1E4F2CF70];
  v20 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2CF70]];
  uint64_t v8 = [(HMDWidgetFetchSpecification *)v5 initWithName:@"Lightbulbs" serviceTypes:v23 associatedServiceTypes:v22 characteristicTypes:v20 affectedWidgetKinds:v4];
  v25[0] = v8;
  id v9 = [HMDWidgetFetchSpecification alloc];
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = *MEMORY[0x1E4F2DED8];
  v24[0] = *MEMORY[0x1E4F2DEA8];
  v24[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  id v13 = [v10 setWithArray:v12];
  id v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
  id v15 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
  v16 = [(HMDWidgetFetchSpecification *)v9 initWithName:@"Outlets & Switches w/ associated Lightbulbs" serviceTypes:v13 associatedServiceTypes:v14 characteristicTypes:v15 affectedWidgetKinds:v4];
  v25[1] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v18 = [v21 setWithArray:v17];

  return (NSSet *)v18;
}

+ (NSSet)allHomeLockScreenWidgetKinds
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"com.apple.Home.widget.summary.category";
  v6[1] = @"com.apple.Home.widget.lights.category";
  v6[2] = @"com.apple.Home.widget.security.category";
  v6[3] = @"com.apple.Home.widget.security.singleAccessory";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

@end