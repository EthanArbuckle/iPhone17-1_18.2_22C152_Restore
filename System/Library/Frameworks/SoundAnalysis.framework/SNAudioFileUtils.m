@interface SNAudioFileUtils
+ ($A0D62BC7BB322857EA05296DE7D5C3FF)getTimeRangeEncompassingEntireAudioFileAtURL:(SEL)a3 error:(id)a4;
- (SNAudioFileUtils)init;
@end

@implementation SNAudioFileUtils

+ ($A0D62BC7BB322857EA05296DE7D5C3FF)getTimeRangeEncompassingEntireAudioFileAtURL:(SEL)a3 error:(id)a4
{
  uint64_t v6 = sub_1DCB86A18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DCB869B8();
  swift_getObjCClassMetadata();
  double v10 = sub_1DCAB9D5C(&v18);
  int64_t v11 = v18;
  int64_t v12 = v19;
  int64_t v13 = v20;
  int64_t v14 = v22;
  uint64_t v15 = *((void *)&v18 + 1);
  uint64_t v16 = v21;
  result = ($A0D62BC7BB322857EA05296DE7D5C3FF *)(*(uint64_t (**)(char *, uint64_t, double))(v7 + 8))(v9, v6, v10);
  retstr->var0.var0 = v11;
  *(void *)&retstr->var0.var1 = v15;
  retstr->var0.var3 = v12;
  retstr->var1.var0 = v13;
  *(void *)&retstr->var1.var1 = v16;
  retstr->var1.var3 = v14;
  return result;
}

- (SNAudioFileUtils)init
{
  return (SNAudioFileUtils *)sub_1DCABB878();
}

@end