@interface _DPNoneDPBudgetAuditor
- (_DPNoneDPBudgetAuditor)initWithMetadata:(id)a3 plistParameters:(id)a4 error:(id *)a5;
@end

@implementation _DPNoneDPBudgetAuditor

- (_DPNoneDPBudgetAuditor)initWithMetadata:(id)a3 plistParameters:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (+[_DPAlgorithmParameters allowDPMechanismNone:v9])
  {
    if (_DPMetadataIsDPMechanismNone(v8))
    {
      v16.receiver = self;
      v16.super_class = (Class)_DPNoneDPBudgetAuditor;
      self = [(_DPBudgetAuditor *)&v16 initWithMetadata:v8 plistParameters:v9 targetADP:0 maxADP:0 analysis:0 error:a5];
      v10 = self;
      goto LABEL_11;
    }
    v14 = [NSString stringWithFormat:@"Invalid DPMechanism=%@.", v8];
    v12 = _DPPrivacyBudgetError(8, v14);

    v13 = +[_DPLog framework];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
  }
  else
  {
    v11 = [NSString stringWithFormat:@"DPMechanismNone is not allowed with plistParameters=%@.", v9];
    v12 = _DPPrivacyBudgetError(7, v11);

    v13 = +[_DPLog framework];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
LABEL_7:
    }
      -[_DPSemanticVersion initWithString:error:]((uint64_t)v12, v13);
  }

  if (a5) {
    *a5 = v12;
  }

  v10 = 0;
LABEL_11:

  return v10;
}

@end