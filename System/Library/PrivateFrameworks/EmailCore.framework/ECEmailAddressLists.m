@interface ECEmailAddressLists
+ (id)addressListFromHeaderValue:(id)a3;
@end

@implementation ECEmailAddressLists

+ (id)addressListFromHeaderValue:(id)a3
{
  id v8 = 0;
  BOOL v3 = +[ECEmailAddressParser parseString:a3 emailAddressList:&v8];
  id v4 = v8;
  v5 = v4;
  id v6 = 0;
  if (v3) {
    id v6 = v4;
  }

  return v6;
}

@end