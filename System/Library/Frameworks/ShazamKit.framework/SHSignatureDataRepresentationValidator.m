@interface SHSignatureDataRepresentationValidator
+ (BOOL)signatureDataIsValid:(id)a3 error:(id *)a4;
@end

@implementation SHSignatureDataRepresentationValidator

+ (BOOL)signatureDataIsValid:(id)a3 error:(id *)a4
{
  if (!a3
    || (uint64_t v6 = 0,
        +[SigCrop getSampleLength:a3 error:&v6],
        BOOL result = v6 == 0,
        v6))
  {
    +[SHError annotateClientError:a4 code:200 underlyingError:0];
    return 0;
  }
  return result;
}

@end