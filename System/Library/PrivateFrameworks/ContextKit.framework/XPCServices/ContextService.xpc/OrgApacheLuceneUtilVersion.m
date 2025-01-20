@interface OrgApacheLuceneUtilVersion
+ (id)fromBitsWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
+ (id)parseLenientlyWithNSString:(id)a3;
+ (id)parseWithNSString:(id)a3;
+ (void)initialize;
- (BOOL)encodedIsValid;
- (BOOL)isEqual:(id)a3;
- (BOOL)onOrAfterWithOrgApacheLuceneUtilVersion:(id)a3;
- (OrgApacheLuceneUtilVersion)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (OrgApacheLuceneUtilVersion)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (id)description;
- (unint64_t)hash;
@end

@implementation OrgApacheLuceneUtilVersion

+ (id)parseWithNSString:(id)a3
{
  return OrgApacheLuceneUtilVersion_parseWithNSString_(a3);
}

+ (id)parseLenientlyWithNSString:(id)a3
{
  return OrgApacheLuceneUtilVersion_parseLenientlyWithNSString_(a3);
}

+ (id)fromBitsWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  return OrgApacheLuceneUtilVersion_fromBitsWithInt_withInt_withInt_(*(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5);
}

- (OrgApacheLuceneUtilVersion)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  sub_100049588(self, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5, 0, v5, v6, v7);
  return self;
}

- (OrgApacheLuceneUtilVersion)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  sub_100049588(self, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, *(uint64_t *)&a6, v6, v7);
  return self;
}

- (BOOL)onOrAfterWithOrgApacheLuceneUtilVersion:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return self->encodedValue_ >= *((_DWORD *)a3 + 6);
}

- (id)description
{
  unint64_t major = self->major_;
  if (self->prerelease_) {
    return (id)JreStrcat("ICICICI", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (id)major);
  }
  else {
    return (id)JreStrcat("ICICI", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (id)major);
  }
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return *((_DWORD *)a3 + 6) == self->encodedValue_;
}

- (BOOL)encodedIsValid
{
  return 1;
}

- (unint64_t)hash
{
  return self->encodedValue_;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v2->major_ = xmmword_10031F950;
    v2->encodedValue_ = 0x100000;
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilVersion_LUCENE_4_0_0_ALPHA_, v2);
    uint64_t v3 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v3->major_ = xmmword_10031F960;
    v3->encodedValue_ = 1048577;
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilVersion_LUCENE_4_0_0_BETA_, v3);
    uint64_t v4 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v4->major_ = xmmword_10031F970;
    v4->encodedValue_ = 1048578;
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilVersion_LUCENE_4_0_0_, v4);
    uint64_t v5 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v5->major_ = xmmword_10031F980;
    v5->encodedValue_ = 1049600;
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilVersion_LUCENE_4_1_0_, v5);
    uint64_t v6 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v6->major_ = xmmword_10031F990;
    v6->encodedValue_ = 1050624;
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilVersion_LUCENE_4_2_0_, v6);
    uint64_t v7 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v7->major_ = xmmword_10031F9A0;
    v7->encodedValue_ = 1050628;
    JreStrongAssignAndConsume(&OrgApacheLuceneUtilVersion_LUCENE_4_2_1_, v7);
    v8 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v8->major_ = xmmword_10031F9B0;
    v8->encodedValue_ = 1051648;
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilVersion_LUCENE_4_3_0_, v8);
    v9 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v9->major_ = xmmword_10031F9C0;
    v9->encodedValue_ = 1051652;
    JreStrongAssignAndConsume(&OrgApacheLuceneUtilVersion_LUCENE_4_3_1_, v9);
    v10 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v10->major_ = xmmword_10031F9D0;
    v10->encodedValue_ = 1052672;
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilVersion_LUCENE_4_4_0_, v10);
    v11 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v11->major_ = xmmword_10031F9E0;
    v11->encodedValue_ = 1053696;
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilVersion_LUCENE_4_5_0_, v11);
    v12 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v12->major_ = xmmword_10031F9F0;
    v12->encodedValue_ = 1053700;
    JreStrongAssignAndConsume(&OrgApacheLuceneUtilVersion_LUCENE_4_5_1_, v12);
    v13 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v13->major_ = xmmword_10031FA00;
    v13->encodedValue_ = 1054720;
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilVersion_LUCENE_4_6_0_, v13);
    v14 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v14->major_ = xmmword_10031FA10;
    v14->encodedValue_ = 1054724;
    JreStrongAssignAndConsume(&OrgApacheLuceneUtilVersion_LUCENE_4_6_1_, v14);
    v15 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v15->major_ = xmmword_10031FA20;
    v15->encodedValue_ = 1055744;
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilVersion_LUCENE_4_7_0_, v15);
    v16 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v16->major_ = xmmword_10031FA30;
    v16->encodedValue_ = 1055748;
    JreStrongAssignAndConsume(&OrgApacheLuceneUtilVersion_LUCENE_4_7_1_, v16);
    v17 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v17->major_ = xmmword_10031FA40;
    v17->encodedValue_ = 1055752;
    JreStrongAssignAndConsume(&OrgApacheLuceneUtilVersion_LUCENE_4_7_2_, v17);
    v18 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v18->major_ = xmmword_10031FA50;
    v18->encodedValue_ = 1056768;
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilVersion_LUCENE_4_8_0_, v18);
    v19 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v19->major_ = xmmword_10031FA60;
    v19->encodedValue_ = 1056772;
    JreStrongAssignAndConsume(&OrgApacheLuceneUtilVersion_LUCENE_4_8_1_, v19);
    v20 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v20->major_ = xmmword_10031FA70;
    v20->encodedValue_ = 1057792;
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilVersion_LUCENE_4_9_0_, v20);
    v21 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v21->major_ = xmmword_10031FA80;
    v21->encodedValue_ = 1057796;
    JreStrongAssignAndConsume(&OrgApacheLuceneUtilVersion_LUCENE_4_9_1_, v21);
    v22 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v22->major_ = xmmword_10031FA90;
    v22->encodedValue_ = 1058816;
    JreStrongAssignAndConsume(&OrgApacheLuceneUtilVersion_LUCENE_4_10_0_, v22);
    v23 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v23->major_ = xmmword_10031FAA0;
    v23->encodedValue_ = 1058820;
    JreStrongAssignAndConsume(&OrgApacheLuceneUtilVersion_LUCENE_4_10_1_, v23);
    v24 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v24->major_ = xmmword_10031FAB0;
    v24->encodedValue_ = 1058824;
    JreStrongAssignAndConsume(&OrgApacheLuceneUtilVersion_LUCENE_4_10_2_, v24);
    v25 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v25->major_ = xmmword_10031FAC0;
    v25->encodedValue_ = 1058828;
    JreStrongAssignAndConsume(&OrgApacheLuceneUtilVersion_LUCENE_4_10_3_, v25);
    v26 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v26->major_ = xmmword_10031FAD0;
    v26->encodedValue_ = 1058832;
    JreStrongAssignAndConsume(&OrgApacheLuceneUtilVersion_LUCENE_4_10_4_, v26);
    v27 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v27->major_ = xmmword_10031FAE0;
    v27->encodedValue_ = 1310720;
    JreStrongAssignAndConsume(&OrgApacheLuceneUtilVersion_LUCENE_5_0_0_, v27);
    v28 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v28->major_ = xmmword_10031FAF0;
    v28->encodedValue_ = 1311744;
    JreStrongAssignAndConsume(&OrgApacheLuceneUtilVersion_LUCENE_5_1_0_, v28);
    v29 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v29->major_ = xmmword_10031FB00;
    v29->encodedValue_ = 1312768;
    JreStrongAssignAndConsume(&OrgApacheLuceneUtilVersion_LUCENE_5_2_0_, v29);
    v30 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v30->major_ = xmmword_10031FB10;
    v30->encodedValue_ = 1312772;
    JreStrongAssignAndConsume(&OrgApacheLuceneUtilVersion_LUCENE_5_2_1_, v30);
    v31 = [OrgApacheLuceneUtilVersion alloc];
    *(_OWORD *)&v31->major_ = xmmword_10031FB20;
    v31->encodedValue_ = 1313792;
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilVersion_LUCENE_5_3_0_, v31);
    JreStrongAssign((id *)&OrgApacheLuceneUtilVersion_LATEST_, (void *)OrgApacheLuceneUtilVersion_LUCENE_5_3_0_);
    JreStrongAssign(&OrgApacheLuceneUtilVersion_LUCENE_CURRENT_, (void *)OrgApacheLuceneUtilVersion_LATEST_);
    JreStrongAssign(&OrgApacheLuceneUtilVersion_LUCENE_4_0_, (void *)OrgApacheLuceneUtilVersion_LUCENE_4_0_0_ALPHA_);
    JreStrongAssign(&OrgApacheLuceneUtilVersion_LUCENE_4_1_, (void *)OrgApacheLuceneUtilVersion_LUCENE_4_1_0_);
    JreStrongAssign(&OrgApacheLuceneUtilVersion_LUCENE_4_2_, (void *)OrgApacheLuceneUtilVersion_LUCENE_4_2_0_);
    JreStrongAssign(&OrgApacheLuceneUtilVersion_LUCENE_4_3_, (void *)OrgApacheLuceneUtilVersion_LUCENE_4_3_0_);
    JreStrongAssign(&OrgApacheLuceneUtilVersion_LUCENE_4_4_, (void *)OrgApacheLuceneUtilVersion_LUCENE_4_4_0_);
    JreStrongAssign(&OrgApacheLuceneUtilVersion_LUCENE_4_5_, (void *)OrgApacheLuceneUtilVersion_LUCENE_4_5_0_);
    JreStrongAssign(&OrgApacheLuceneUtilVersion_LUCENE_4_6_, (void *)OrgApacheLuceneUtilVersion_LUCENE_4_6_0_);
    JreStrongAssign(&OrgApacheLuceneUtilVersion_LUCENE_4_7_, (void *)OrgApacheLuceneUtilVersion_LUCENE_4_7_0_);
    JreStrongAssign(&OrgApacheLuceneUtilVersion_LUCENE_4_8_, (void *)OrgApacheLuceneUtilVersion_LUCENE_4_8_0_);
    JreStrongAssign(&OrgApacheLuceneUtilVersion_LUCENE_4_9_, (void *)OrgApacheLuceneUtilVersion_LUCENE_4_9_0_);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilVersion__initialized);
  }
}

@end