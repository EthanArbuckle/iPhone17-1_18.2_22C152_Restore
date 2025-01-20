@interface NTKGreyhoundTextUtilities
+ (id)fontForDevice:(id)a3 style:(unint64_t)a4 density:(unint64_t)a5 typeface:(unint64_t)a6;
+ (id)textForHour:(unint64_t)a3 density:(unint64_t)a4 style:(unint64_t)a5 typeface:(unint64_t)a6;
@end

@implementation NTKGreyhoundTextUtilities

+ (id)textForHour:(unint64_t)a3 density:(unint64_t)a4 style:(unint64_t)a5 typeface:(unint64_t)a6
{
  if (qword_193D8 != -1) {
    dispatch_once(&qword_193D8, &stru_143E8);
  }
  if (a5 == 1)
  {
    v14 = [(id)qword_193D0 objectAtIndexedSubscript:1];
    v13 = [v14 objectAtIndexedSubscript:a6 == 2];
  }
  else if (a5)
  {
    v13 = [(id)qword_193D0 objectAtIndexedSubscript:a5];
  }
  else
  {
    v10 = [(id)qword_193D0 objectAtIndexedSubscript:0];
    v11 = v10;
    if (a6 == 1)
    {
      v12 = [v10 objectAtIndexedSubscript:1];
      v13 = [v12 objectAtIndexedSubscript:a4];
    }
    else
    {
      v13 = [v10 objectAtIndexedSubscript:a6];
    }
  }
  v15 = [v13 objectAtIndexedSubscript:a3 - 1];

  return v15;
}

+ (id)fontForDevice:(id)a3 style:(unint64_t)a4 density:(unint64_t)a5 typeface:(unint64_t)a6
{
  __chkstk_darwin(a1, a2, a3, a4, a5, a6);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  id v13 = v12;
  if (qword_193E8 != -1) {
    dispatch_once(&qword_193E8, &stru_14408);
  }
  v14 = [(id)qword_193E0 objectAtIndexedSubscript:v7];
  v15 = [v14 objectAtIndexedSubscript:v9];

  id v16 = v13;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1A4D8);
  id WeakRetained = objc_loadWeakRetained(&qword_1A4E0);
  if (WeakRetained)
  {
    v18 = WeakRetained;
    id v19 = objc_loadWeakRetained(&qword_1A4E0);
    if (v19 == v16)
    {
      id v20 = [v16 version];
      uint64_t v21 = qword_1A4E8;

      if (v20 == (id)v21) {
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  id v22 = objc_storeWeak(&qword_1A4E0, v16);
  qword_1A4E8 = (uint64_t)[v16 version];

  sub_4DEC(v23, v16);
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1A4D8);
  memcpy(__dst, qword_193F0, 0x10E0uLL);
  __dst[540] = qword_1A4D0;

  v24 = +[CLKFont fontWithDescriptor:v15 size:*(double *)&__dst[15 * v9 + 510 + 5 * v7 + v11]];

  return v24;
}

@end