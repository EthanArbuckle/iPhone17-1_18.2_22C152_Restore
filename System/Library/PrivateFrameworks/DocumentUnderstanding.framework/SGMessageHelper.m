@interface SGMessageHelper
+ (id)parseRfc822:(id)a3;
@end

@implementation SGMessageHelper

+ (id)parseRfc822:(id)a3
{
  id v7 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v8 = (void *)qword_2688A6F58;
  uint64_t v19 = qword_2688A6F58;
  if (!qword_2688A6F58)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_23697966C;
    v15[3] = &unk_264CB4568;
    v15[4] = &v16;
    sub_23697966C((uint64_t)v15, v3, v4, v5, v6);
    v8 = (void *)v17[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v16, 8);
  v13 = objc_msgSend_parseRfc822_(v9, v10, (uint64_t)v7, v11, v12);

  return v13;
}

@end