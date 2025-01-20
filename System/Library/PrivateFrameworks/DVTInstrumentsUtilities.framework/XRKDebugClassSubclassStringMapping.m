@interface XRKDebugClassSubclassStringMapping
+ (id)kDebugClassNameForClass:(unsigned __int8)a3;
+ (id)kDebugSubclassNameForClass:(unsigned __int8)a3 subclass:(unsigned __int8)a4;
@end

@implementation XRKDebugClassSubclassStringMapping

+ (id)kDebugClassNameForClass:(unsigned __int8)a3
{
  unsigned int v5 = a3;
  if (qword_2687AA0F8 != -1) {
    dispatch_once(&qword_2687AA0F8, &unk_26E7524F0);
  }
  v6 = (void *)qword_2687AA0F0;

  return [v6 objectForIntegerKey:a2];
}

+ (id)kDebugSubclassNameForClass:(unsigned __int8)a3 subclass:(unsigned __int8)a4
{
  unsigned int v5 = a4;
  unsigned int v6 = a3;
  if (qword_2687AA108 != -1) {
    dispatch_once(&qword_2687AA108, &unk_26E752690);
  }
  v7 = [qword_2687AA100 objectForIntegerKey:a2];
  v11 = v7;
  if (v7)
  {
    v12 = [v7 objectForIntegerKey:v8];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end