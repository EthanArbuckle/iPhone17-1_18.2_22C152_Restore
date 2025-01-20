@interface EKStructuredLocationSemanticIdentifierGenerator
+ (id)semanticIdentifierForLocationWithTitle:(id)a3 address:(id)a4 mapKitHandle:(id)a5 contactLabel:(id)a6 latitude:(id)a7 longitude:(id)a8 radius:(id)a9;
@end

@implementation EKStructuredLocationSemanticIdentifierGenerator

+ (id)semanticIdentifierForLocationWithTitle:(id)a3 address:(id)a4 mapKitHandle:(id)a5 contactLabel:(id)a6 latitude:(id)a7 longitude:(id)a8 radius:(id)a9
{
  unint64_t v14 = (unint64_t)a3;
  unint64_t v15 = (unint64_t)a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (!(v14 | v15))
  {
    if (v16)
    {
      id v24 = [v16 base64EncodedStringWithOptions:0];
    }
    else if (v17)
    {
      id v24 = v17;
    }
    else
    {
      v23 = 0;
      if (!v18 || !v19) {
        goto LABEL_18;
      }
      v25 = NSString;
      [v18 floatValue];
      double v27 = v26;
      [v19 floatValue];
      double v29 = v28;
      if (v20)
      {
        [v20 floatValue];
        objc_msgSend(v25, "stringWithFormat:", @"%f:%f:%f", *(void *)&v27, *(void *)&v29, v30);
      }
      else
      {
        objc_msgSend(v25, "stringWithFormat:", @"%f:%f", *(void *)&v27, v28, v32);
      }
      id v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = v24;
    goto LABEL_18;
  }
  v21 = [MEMORY[0x1E4F28E78] string];
  v22 = v21;
  if (v14) {
    [v21 appendFormat:@"TITLE=%@;", v14];
  }
  if (v15) {
    [v22 appendFormat:@"ADDRESS=%@;", v15];
  }
  v23 = (void *)[v22 copy];

LABEL_18:

  return v23;
}

@end