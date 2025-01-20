@interface IRCandidateInspection
- (IRCandidateInspection)initWithInspectionGenerator:(id)a3;
- (IRCandidateInspection)initWithInspectionServicePackage:(id)a3;
- (IRCandidateInspectionGenerator)inspectionGenerator;
- (IRCandidateInspectionServicePackage)inspectionServicePackage;
- (id)exportCandidateInspectionAsDictionary;
- (id)getCandidateIdentifier;
- (id)getClassificationDescription;
- (int64_t)getClassification;
@end

@implementation IRCandidateInspection

- (IRCandidateInspection)initWithInspectionGenerator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IRCandidateInspection;
  v6 = [(IRCandidateInspection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_inspectionGenerator, a3);
  }

  return v7;
}

- (IRCandidateInspection)initWithInspectionServicePackage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IRCandidateInspection;
  v6 = [(IRCandidateInspection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_inspectionServicePackage, a3);
  }

  return v7;
}

- (id)exportCandidateInspectionAsDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:&stru_27039A840 forKeyedSubscript:@"ServicePackageInspection"];
  [v3 setObject:&stru_27039A840 forKeyedSubscript:@"GeneratorInspection"];
  v4 = [(IRCandidateInspection *)self inspectionServicePackage];

  if (v4)
  {
    id v5 = [(IRCandidateInspection *)self inspectionServicePackage];
    v6 = [v5 exportCandidateInspectionAsDictionary];
    [v3 setObject:v6 forKeyedSubscript:@"ServicePackageInspection"];
  }
  v7 = [(IRCandidateInspection *)self inspectionGenerator];

  if (v7)
  {
    v8 = [(IRCandidateInspection *)self inspectionGenerator];
    objc_super v9 = [v8 exportCandidateInspectionAsDictionary];
    [v3 setObject:v9 forKeyedSubscript:@"GeneratorInspection"];
  }

  return v3;
}

- (int64_t)getClassification
{
  id v3 = [(IRCandidateInspection *)self inspectionServicePackage];

  if (v3)
  {
    v4 = [(IRCandidateInspection *)self inspectionServicePackage];
LABEL_5:
    v6 = v4;
    int64_t v7 = [v4 classification];

    return v7;
  }
  id v5 = [(IRCandidateInspection *)self inspectionGenerator];

  if (v5)
  {
    v4 = [(IRCandidateInspection *)self inspectionGenerator];
    goto LABEL_5;
  }
  return 0;
}

- (id)getClassificationDescription
{
  id v3 = [(IRCandidateInspection *)self inspectionServicePackage];

  if (v3)
  {
    v4 = [(IRCandidateInspection *)self inspectionServicePackage];
LABEL_5:
    v6 = v4;
    int64_t v7 = [v4 classificationDescription];

    goto LABEL_6;
  }
  id v5 = [(IRCandidateInspection *)self inspectionGenerator];

  if (v5)
  {
    v4 = [(IRCandidateInspection *)self inspectionGenerator];
    goto LABEL_5;
  }
  int64_t v7 = &stru_27039A840;
LABEL_6:

  return v7;
}

- (id)getCandidateIdentifier
{
  id v3 = [(IRCandidateInspection *)self inspectionServicePackage];

  if (v3)
  {
    v4 = [(IRCandidateInspection *)self inspectionServicePackage];
LABEL_5:
    v6 = v4;
    int64_t v7 = [v4 candidate];
    v8 = [v7 candidateIdentifier];

    goto LABEL_6;
  }
  id v5 = [(IRCandidateInspection *)self inspectionGenerator];

  if (v5)
  {
    v4 = [(IRCandidateInspection *)self inspectionGenerator];
    goto LABEL_5;
  }
  v8 = &stru_27039A840;
LABEL_6:

  return v8;
}

- (IRCandidateInspectionServicePackage)inspectionServicePackage
{
  return self->_inspectionServicePackage;
}

- (IRCandidateInspectionGenerator)inspectionGenerator
{
  return self->_inspectionGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inspectionGenerator, 0);

  objc_storeStrong((id *)&self->_inspectionServicePackage, 0);
}

@end