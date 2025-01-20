@interface _BlastDoorHWEncoding
+ (id)dataRepresentation:(id)a3 frame:(CGRect)a4 bound:(CGRect)a5 uuid:(id)a6 date:(id)a7;
+ (id)decodeHandwritingFromData:(id)a3;
+ (id)encodeHandwriting:(id)a3 compress:(BOOL)a4;
@end

@implementation _BlastDoorHWEncoding

+ (id)encodeHandwriting:(id)a3 compress:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (getHWEncodingClass())
  {
    v6 = [getHWEncodingClass() encodeHandwriting:v5 compress:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)decodeHandwritingFromData:(id)a3
{
  id v3 = a3;
  if (getHWEncodingClass())
  {
    BOOL v4 = [getHWEncodingClass() decodeHandwritingFromData:v3];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (id)dataRepresentation:(id)a3 frame:(CGRect)a4 bound:(CGRect)a5 uuid:(id)a6 date:(id)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v12 = a4.size.height;
  double v13 = a4.size.width;
  double v14 = a4.origin.y;
  double v15 = a4.origin.x;
  id v18 = a6;
  id v19 = a7;
  v20 = +[_BlastDoorDrawing createDrawing:frame:bound:](_BlastDoorDrawing, "createDrawing:frame:bound:", a3, v15, v14, v13, v12, x, y, width, height);
  if (v20)
  {
    v21 = +[_BlastDoorHWHandwritingItem createHandwritingItem:v20 uuid:v18 date:v19];
    if (v21)
    {
      v22 = [a1 encodeHandwriting:v21 compress:1];
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end