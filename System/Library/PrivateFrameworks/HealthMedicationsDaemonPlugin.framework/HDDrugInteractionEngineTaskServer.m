@interface HDDrugInteractionEngineTaskServer
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_interactionClassForLifestyleFactor:(unint64_t)a3 completion:(id)a4;
- (void)remote_interactionClassesForConceptWithIdentifier:(id)a3 completion:(id)a4;
- (void)remote_interactionClassesForMedication:(id)a3 completion:(id)a4;
- (void)remote_interactionResultForFirstMedication:(id)a3 secondMedication:(id)a4 completion:(id)a5;
- (void)remote_interactionResultForMedication:(id)a3 lifestyleFactor:(unint64_t)a4 completion:(id)a5;
- (void)remote_interactionResultsForInteractionClasses:(id)a3 completion:(id)a4;
- (void)remote_interactionResultsForMedications:(id)a3 lifestyleFactors:(id)a4 completion:(id)a5;
- (void)remote_numberOfInteractionsForConceptWithIdentifier:(id)a3 completion:(id)a4;
- (void)remote_numberOfInteractionsForMedication:(id)a3 completion:(id)a4;
@end

@implementation HDDrugInteractionEngineTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F66BC0];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F66AC0] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F66AC0] clientInterface];
}

- (void)remote_interactionClassesForConceptWithIdentifier:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  v8 = [(HDStandardTaskServer *)self profile];
  id v11 = 0;
  v9 = +[HDDrugInteractionEngine interactionClassesForConceptWithIdentifier:v7 profile:v8 error:&v11];

  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (void)remote_interactionClassesForMedication:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  v8 = [(HDStandardTaskServer *)self profile];
  id v11 = 0;
  v9 = +[HDDrugInteractionEngine interactionClassesForMedication:v7 profile:v8 error:&v11];

  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (void)remote_numberOfInteractionsForConceptWithIdentifier:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  v8 = [(HDStandardTaskServer *)self profile];
  id v11 = 0;
  v9 = +[HDDrugInteractionEngine numberOfInteractionsForConceptWithIdentifier:v7 profile:v8 error:&v11];

  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (void)remote_numberOfInteractionsForMedication:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  v8 = [(HDStandardTaskServer *)self profile];
  id v11 = 0;
  v9 = +[HDDrugInteractionEngine numberOfInteractionsForMedication:v7 profile:v8 error:&v11];

  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (void)remote_interactionClassForLifestyleFactor:(unint64_t)a3 completion:(id)a4
{
  v6 = (void (**)(id, void, id))a4;
  id v7 = [(HDStandardTaskServer *)self profile];
  id v11 = 0;
  id v12 = 0;
  LODWORD(a3) = +[HDDrugInteractionEngine interactionClassForLifestyleFactor:a3 profile:v7 interactionClassOut:&v12 error:&v11];
  id v8 = v12;
  id v9 = v11;

  if (a3) {
    id v10 = v8;
  }
  else {
    id v10 = 0;
  }
  ((void (**)(id, id, id))v6)[2](v6, v10, v9);
}

- (void)remote_interactionResultsForInteractionClasses:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  id v8 = [(HDStandardTaskServer *)self profile];
  id v11 = 0;
  id v9 = +[HDDrugInteractionEngine interactionResultsForInteractionClasses:v7 profile:v8 error:&v11];

  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (void)remote_interactionResultForFirstMedication:(id)a3 secondMedication:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(id, void, id))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(HDStandardTaskServer *)self profile];
  id v16 = 0;
  id v17 = 0;
  BOOL v12 = +[HDDrugInteractionEngine interactionResultForFirstMedication:v10 secondMedication:v9 profile:v11 interactionResultOut:&v17 error:&v16];

  id v13 = v17;
  id v14 = v16;

  if (v12) {
    id v15 = v13;
  }
  else {
    id v15 = 0;
  }
  ((void (**)(id, id, id))v8)[2](v8, v15, v14);
}

- (void)remote_interactionResultForMedication:(id)a3 lifestyleFactor:(unint64_t)a4 completion:(id)a5
{
  id v8 = (void (**)(id, void, id))a5;
  id v9 = a3;
  id v10 = [(HDStandardTaskServer *)self profile];
  id v14 = 0;
  id v15 = 0;
  LODWORD(a4) = +[HDDrugInteractionEngine interactionResultForMedication:v9 lifestyleFactor:a4 profile:v10 interactionResultOut:&v15 error:&v14];

  id v11 = v15;
  id v12 = v14;

  if (a4) {
    id v13 = v11;
  }
  else {
    id v13 = 0;
  }
  ((void (**)(id, id, id))v8)[2](v8, v13, v12);
}

- (void)remote_interactionResultsForMedications:(id)a3 lifestyleFactors:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(id, void *, id))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(HDStandardTaskServer *)self profile];
  id v14 = 0;
  id v12 = +[HDDrugInteractionEngine interactionResultsForMedications:v10 lifestyleFactors:v9 profile:v11 error:&v14];

  id v13 = v14;
  v8[2](v8, v12, v13);
}

@end