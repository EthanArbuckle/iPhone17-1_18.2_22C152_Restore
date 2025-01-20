@interface _CNRegExHandleStringClassificationStrategy
+ (BOOL)doesStringLookLikeEmailAddress:(id)a3;
+ (BOOL)doesStringLookLikePhoneNumber:(id)a3;
- (unint64_t)classificationOfHandleString:(id)a3;
@end

@implementation _CNRegExHandleStringClassificationStrategy

- (unint64_t)classificationOfHandleString:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() doesStringLookLikePhoneNumber:v3]) {
    unint64_t v4 = 2;
  }
  else {
    unint64_t v4 = [(id)objc_opt_class() doesStringLookLikeEmailAddress:v3];
  }

  return v4;
}

+ (BOOL)doesStringLookLikePhoneNumber:(id)a3
{
  return +[CNPhoneNumberHelper isStringPhoneNumber:a3];
}

+ (BOOL)doesStringLookLikeEmailAddress:(id)a3
{
  return +[CNEmailAddressUtilities isStringEmailAddress:a3];
}

@end