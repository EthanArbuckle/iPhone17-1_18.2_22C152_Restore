@interface DMTTaskOperationBuilder
+ (Class)validationClassForRequest:(id)a3;
- (BOOL)validateRequest:(id)a3 error:(id *)a4;
- (DMTDeviceInformationPrimitives)deviceInfoPrimitives;
- (DMTEnrollmentInitiating)enrollmentInitiator;
- (DMTEnrollmentPrerequisiteReceiving)enrollmentPrerequisiteReceiver;
- (DMTEnrollmentStateProviding)enrollmentStateProvider;
- (DMTTaskOperationBuilder)initWithDeviceInfoPrimitives:(id)a3 enrollmentPrerequisiteReceiver:(id)a4 enrollmentInitiator:(id)a5 enrollmentStateProvider:(id)a6;
- (id)taskOperationForRequest:(id)a3;
@end

@implementation DMTTaskOperationBuilder

- (DMTTaskOperationBuilder)initWithDeviceInfoPrimitives:(id)a3 enrollmentPrerequisiteReceiver:(id)a4 enrollmentInitiator:(id)a5 enrollmentStateProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)DMTTaskOperationBuilder;
  v15 = [(DMTTaskOperationBuilder *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deviceInfoPrimitives, a3);
    objc_storeStrong((id *)&v16->_enrollmentPrerequisiteReceiver, a4);
    objc_storeStrong((id *)&v16->_enrollmentInitiator, a5);
    objc_storeStrong((id *)&v16->_enrollmentStateProvider, a6);
  }

  return v16;
}

- (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[DMTTaskOperationBuilder validationClassForRequest:v5];
  if (v6) {
    char v7 = [(objc_class *)v6 validateRequest:v5 error:a4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)taskOperationForRequest:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = [DMTFetchAutomatedDeviceEnrollmentPrerequisitesOperation alloc];
    v6 = [(DMTTaskOperationBuilder *)self deviceInfoPrimitives];
    uint64_t v7 = [(DMTFetchAutomatedDeviceEnrollmentPrerequisitesOperation *)v5 initWithRequest:v4 deviceInformationPrimitives:v6];
LABEL_7:
    v10 = (DMTPerformAutomatedDeviceEnrollmentOperation *)v7;
    goto LABEL_8;
  }
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v8 = [DMTPerformAutomatedDeviceEnrollmentOperation alloc];
    v6 = [(DMTTaskOperationBuilder *)self enrollmentPrerequisiteReceiver];
    v9 = [(DMTTaskOperationBuilder *)self enrollmentInitiator];
    v10 = [(DMTPerformAutomatedDeviceEnrollmentOperation *)v8 initWithRequest:v4 prerequisiteReceiver:v6 enrollmentInitiator:v9];

LABEL_8:
    goto LABEL_9;
  }
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v11 = [DMTFetchAutomatedDeviceEnrollmentStateOperation alloc];
    v6 = [(DMTTaskOperationBuilder *)self enrollmentStateProvider];
    uint64_t v7 = [(DMTFetchAutomatedDeviceEnrollmentStateOperation *)v11 initWithRequest:v4 enrollmentStateProvider:v6];
    goto LABEL_7;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

+ (Class)validationClassForRequest:(id)a3
{
  v15[3] = *MEMORY[0x263EF8340];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v14[0] = v6;
  v15[0] = objc_opt_class();
  uint64_t v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v14[1] = v8;
  v15[1] = objc_opt_class();
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v14[2] = v10;
  v15[2] = objc_opt_class();
  id v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  id v12 = [v11 objectForKeyedSubscript:v4];

  return (Class)v12;
}

- (DMTDeviceInformationPrimitives)deviceInfoPrimitives
{
  return self->_deviceInfoPrimitives;
}

- (DMTEnrollmentPrerequisiteReceiving)enrollmentPrerequisiteReceiver
{
  return self->_enrollmentPrerequisiteReceiver;
}

- (DMTEnrollmentInitiating)enrollmentInitiator
{
  return self->_enrollmentInitiator;
}

- (DMTEnrollmentStateProviding)enrollmentStateProvider
{
  return self->_enrollmentStateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentStateProvider, 0);
  objc_storeStrong((id *)&self->_enrollmentInitiator, 0);
  objc_storeStrong((id *)&self->_enrollmentPrerequisiteReceiver, 0);
  objc_storeStrong((id *)&self->_deviceInfoPrimitives, 0);
}

@end