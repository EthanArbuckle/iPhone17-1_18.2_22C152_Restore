@interface CLGpsPosition
+ (BOOL)supportsSecureCoding;
- ($8346F60F14D5FFA78589B066C3F3C2F8)gpsLocationPrivate;
- ($FC467A9753EF35A59AAA53554404748C)gpsLocation;
- (BOOL)isStaleFix:()time_point<std:(std:()std:(1000000000>>>)a3 :ratio<1 :chrono::duration<long)long :chrono::steady_clock;
- (CLGpsPosition)init;
- (CLGpsPosition)initWithCoder:(id)a3;
- (CLGpsPosition)initWithLocation:(id *)a3 andPrivateLocation:(id *)a4;
- (id).cxx_construct;
- (id)description;
- (time_point<std::chrono::steady_clock,)expiry;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLGpsPosition

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLGpsPosition)init
{
  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2, v3);

  return 0;
}

- (CLGpsPosition)initWithLocation:(id *)a3 andPrivateLocation:(id *)a4
{
  v18.receiver = self;
  v18.super_class = (Class)CLGpsPosition;
  v6 = [(CLGpsPosition *)&v18 init];
  if (v6)
  {
    v7.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    long long v8 = *(_OWORD *)&a3->var1.var1;
    *((_OWORD *)v6 + 1) = *(_OWORD *)&a3->var0;
    *((_OWORD *)v6 + 2) = v8;
    long long v9 = *(_OWORD *)&a3->var3;
    long long v10 = *(_OWORD *)&a3->var5;
    long long v11 = *(_OWORD *)&a3->var9;
    *((_OWORD *)v6 + 5) = *(_OWORD *)&a3->var7;
    *((_OWORD *)v6 + 6) = v11;
    *((_OWORD *)v6 + 3) = v9;
    *((_OWORD *)v6 + 4) = v10;
    long long v12 = *(_OWORD *)&a3->var11;
    $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a3->var13;
    long long v14 = *(_OWORD *)&a3->var14;
    *(_OWORD *)(v6 + 156) = *(_OWORD *)&a3->var16;
    *(($F24F406B2B787EFB06265DBA3D28CBD5 *)v6 + 8) = var13;
    *((_OWORD *)v6 + 9) = v14;
    *((_OWORD *)v6 + 7) = v12;
    *(void *)&long long v12 = *(void *)&a3->var10;
    std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v15 = v7.__d_.__rep_ + (uint64_t)(*(double *)&v12 * 1000000000.0);
    if (*(double *)&v12 < 0.0) {
      std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    *((void *)v6 + 1) = v15;
    memcpy(v6 + 176, a4, 0x230uLL);
    v16 = v6;
  }

  return (CLGpsPosition *)v6;
}

- (BOOL)isStaleFix:()time_point<std:(std:()std:(1000000000>>>)a3 :ratio<1 :chrono::duration<long)long :chrono::steady_clock
{
  return self->_expiry.__d_.__rep_ <= a3.__d_.__rep_;
}

- (CLGpsPosition)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLGpsPosition;
  v5 = [(CLGpsPosition *)&v16 init];
  if (v5)
  {
    sub_221E36CC8(v4, (char *)v15);
    long long v6 = *(_OWORD *)((char *)&v15[8] + 12);
    long long v8 = v15[7];
    long long v7 = v15[8];
    *((_OWORD *)v5 + 7) = v15[6];
    *((_OWORD *)v5 + 8) = v8;
    *((_OWORD *)v5 + 9) = v7;
    *(_OWORD *)(v5 + 156) = v6;
    long long v10 = v15[4];
    long long v9 = v15[5];
    long long v11 = v15[3];
    *((_OWORD *)v5 + 3) = v15[2];
    *((_OWORD *)v5 + 4) = v11;
    *((_OWORD *)v5 + 5) = v10;
    *((_OWORD *)v5 + 6) = v9;
    long long v12 = v15[1];
    *((_OWORD *)v5 + 1) = v15[0];
    *((_OWORD *)v5 + 2) = v12;
    sub_221E36D70(v4, (char *)v15);
    memcpy(v5 + 176, v15, 0x230uLL);
    *((void *)v5 + 1) = sub_221E36EC0(v4);
    v13 = v5;
  }

  return (CLGpsPosition *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  sub_221E36D5C((uint64_t)v7, (uint64_t)&self->_gpsLocation);
  sub_221E36E04((uint64_t)v7, (uint64_t)&self->_gpsLocation.ellipsoidalAltitude);
  sub_221E36F08(v7, (const char *)&self->_expiry, v4, v5, v6);
}

- (id)description
{
  uint64_t v6 = NSString;
  objc_msgSend_gpsLocation(self, a2, v2, v3, v4);
  objc_msgSend_gpsLocation(self, v7, v8, v9, v10);
  long long v14 = objc_msgSend_stringWithFormat_(v6, v11, @"lat/lon=[%lf, %lf]", v12, v13);
  return v14;
}

- ($FC467A9753EF35A59AAA53554404748C)gpsLocation
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v3 = *($F24F406B2B787EFB06265DBA3D28CBD5 *)&self->var14;
  *($F24F406B2B787EFB06265DBA3D28CBD5 *)&retstr->var11 = self->var13;
  retstr->$F24F406B2B787EFB06265DBA3D28CBD5 var13 = v3;
  *(_OWORD *)&retstr->var14 = *(_OWORD *)&self->var17;
  *(_OWORD *)&retstr->var16 = *(_OWORD *)(&self->var19 + 1);
  long long v4 = *(_OWORD *)&self->var7;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&self->var5;
  *(_OWORD *)&retstr->var5 = v4;
  long long v5 = *(_OWORD *)&self->var11;
  *(_OWORD *)&retstr->var7 = *(_OWORD *)&self->var9;
  *(_OWORD *)&retstr->var9 = v5;
  long long v6 = *(_OWORD *)&self->var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var1.var1 = v6;
  return self;
}

- ($8346F60F14D5FFA78589B066C3F3C2F8)gpsLocationPrivate
{
  return ($8346F60F14D5FFA78589B066C3F3C2F8 *)memcpy(retstr, &self->_gpsLocation.ellipsoidalAltitude, sizeof($8346F60F14D5FFA78589B066C3F3C2F8));
}

- (time_point<std::chrono::steady_clock,)expiry
{
  return self->_expiry;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end