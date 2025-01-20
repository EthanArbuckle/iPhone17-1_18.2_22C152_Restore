@interface NSDictionary(DiagnosticCase)
- (id)logSignatureDescription;
@end

@implementation NSDictionary(DiagnosticCase)

- (id)logSignatureDescription
{
  if (logSignatureDescription_onceToken != -1) {
    dispatch_once(&logSignatureDescription_onceToken, &__block_literal_global_17);
  }
  v2 = [a1 objectForKeyedSubscript:@"domain"];
  v3 = [a1 objectForKeyedSubscript:@"type"];
  v4 = [a1 objectForKeyedSubscript:@"detected"];
  int v5 = logSignatureDescription_isInternal;
  uint64_t v6 = [a1 objectForKeyedSubscript:@"subtype"];
  v7 = (void *)v6;
  if (v5)
  {
    v8 = [a1 objectForKeyedSubscript:@"additional"];
    v9 = (void *)[[NSString alloc] initWithFormat:@"{domain:%@, type:%@, subtype:%@, subtypeContext:%@, process:%@}", v2, v3, v7, v8, v4];
  }
  else
  {
    if (v6) {
      v10 = @"…";
    }
    else {
      v10 = &stru_26BDE2C70;
    }
    v11 = v10;

    v12 = [a1 objectForKeyedSubscript:@"additional"];
    if (v12) {
      v13 = @"…";
    }
    else {
      v13 = &stru_26BDE2C70;
    }
    v8 = v13;

    v9 = (void *)[[NSString alloc] initWithFormat:@"{domain:%@, type:%@, %@%@, process:%@}", v2, v3, v11, v8, v4];
    v7 = v11;
  }

  return v9;
}

@end