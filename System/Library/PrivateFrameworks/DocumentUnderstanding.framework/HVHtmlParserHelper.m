@interface HVHtmlParserHelper
+ (id)parseHTMLString:(id)a3;
@end

@implementation HVHtmlParserHelper

+ (id)parseHTMLString:(id)a3
{
  id v7 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2050000000;
  v8 = (void *)qword_2688A6F08;
  uint64_t v25 = qword_2688A6F08;
  if (!qword_2688A6F08)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = sub_23696DCC4;
    v21[3] = &unk_264CB4568;
    v21[4] = &v22;
    sub_23696DCC4((uint64_t)v21, v3, v4, v5, v6);
    v8 = (void *)v23[3];
  }
  v9 = v8;
  _Block_object_dispose(&v22, 8);
  id v10 = [v9 alloc];
  v14 = objc_msgSend_initWithString_(v10, v11, (uint64_t)v7, v12, v13);
  v19 = objc_msgSend_textContent(v14, v15, v16, v17, v18);

  return v19;
}

@end