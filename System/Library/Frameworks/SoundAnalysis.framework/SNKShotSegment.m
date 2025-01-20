@interface SNKShotSegment
- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange;
- (NSURL)url;
- (SNKShotSegment)init;
- (void)setTimeRange:(id *)a3;
- (void)setUrl:(id)a3;
@end

@implementation SNKShotSegment

- (SNKShotSegment)init
{
  SNKShotSegment.init()();
  return result;
}

- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange
{
  sub_1DC88EAE4((uint64_t)v9);
  int64_t v5 = v12;
  uint64_t v6 = v9[1];
  uint64_t v7 = v11;
  long long v8 = v10;
  retstr->var0.var0 = v9[0];
  *(void *)&retstr->var0.var1 = v6;
  *(_OWORD *)&retstr->var0.var3 = v8;
  *(void *)&retstr->var1.var1 = v7;
  retstr->var1.var3 = v5;
  return result;
}

- (void)setTimeRange:(id *)a3
{
  int64_t var3 = a3->var1.var3;
  v4[0] = *(double *)&a3->var0.var0;
  v4[1] = *(double *)&a3->var0.var1;
  long long v5 = *(_OWORD *)&a3->var0.var3;
  uint64_t v6 = *(void *)&a3->var1.var1;
  int64_t v7 = var3;
  sub_1DC88EBA4(v4);
}

- (NSURL)url
{
  uint64_t v2 = sub_1DCB86A18();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  long long v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DC88EE08((uint64_t)v5);
  uint64_t v6 = (void *)sub_1DCB86948();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return (NSURL *)v6;
}

- (void)setUrl:(id)a3
{
  uint64_t v4 = sub_1DCB86A18();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DCB869B8();
  int64_t v7 = self;
  sub_1DC88EF68((uint64_t)v6);
}

- (void).cxx_destruct
{
}

@end