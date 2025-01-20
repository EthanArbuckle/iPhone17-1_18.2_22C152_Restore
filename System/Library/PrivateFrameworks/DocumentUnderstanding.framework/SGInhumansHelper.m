@interface SGInhumansHelper
+ (BOOL)isInhumanEmailAddress:(id)a3;
@end

@implementation SGInhumansHelper

+ (BOOL)isInhumanEmailAddress:(id)a3
{
  id v7 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v8 = (void *)qword_26AD8C170;
  uint64_t v18 = qword_26AD8C170;
  if (!qword_26AD8C170)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_2369799E8;
    v14[3] = &unk_264CB4568;
    v14[4] = &v15;
    sub_2369799E8((uint64_t)v14, v3, v4, v5, v6);
    v8 = (void *)v16[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v15, 8);
  LOBYTE(v9) = objc_msgSend_isInhumanEmailAddress_(v9, v10, (uint64_t)v7, v11, v12);

  return (char)v9;
}

@end