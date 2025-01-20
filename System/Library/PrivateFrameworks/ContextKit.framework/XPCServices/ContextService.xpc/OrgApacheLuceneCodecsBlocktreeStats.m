@interface OrgApacheLuceneCodecsBlocktreeStats
- (OrgApacheLuceneCodecsBlocktreeStats)initWithNSString:(id)a3 withNSString:(id)a4;
- (id)description;
- (void)dealloc;
- (void)endBlockWithOrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame:(id)a3;
- (void)startBlockWithOrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame:(id)a3 withBoolean:(BOOL)a4;
- (void)termWithOrgApacheLuceneUtilBytesRef:(id)a3;
@end

@implementation OrgApacheLuceneCodecsBlocktreeStats

- (OrgApacheLuceneCodecsBlocktreeStats)initWithNSString:(id)a3 withNSString:(id)a4
{
  return self;
}

- (void)startBlockWithOrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame:(id)a3 withBoolean:(BOOL)a4
{
  ++self->totalBlockCount_;
  if (a4)
  {
    if (!a3) {
      goto LABEL_16;
    }
    if (*((void *)a3 + 4) == *((void *)a3 + 5)) {
      ++self->floorBlockCount_;
    }
    uint64_t v10 = 40;
  }
  else
  {
    uint64_t v10 = 32;
  }
  ++*(_DWORD *)((char *)&self->super.isa + v10);
  p_blockCountByPrefixLen = &self->blockCountByPrefixLen_;
  blockCountByPrefixLen = self->blockCountByPrefixLen_;
  if (!blockCountByPrefixLen) {
    goto LABEL_16;
  }
  if (!a3) {
    goto LABEL_16;
  }
  int v13 = *((_DWORD *)a3 + 26);
  if (blockCountByPrefixLen->super.size_ <= v13)
  {
    v14 = OrgApacheLuceneUtilArrayUtil_growWithIntArray_withInt_((unsigned int *)self->blockCountByPrefixLen_, v13 + 1, (uint64_t)a3, a4, v4, v5, v6, v7);
    JreStrongAssign((id *)&self->blockCountByPrefixLen_, v14);
    blockCountByPrefixLen = *p_blockCountByPrefixLen;
    if (!*p_blockCountByPrefixLen) {
      goto LABEL_16;
    }
  }
  int v15 = *((_DWORD *)a3 + 26);
  uint64_t size = blockCountByPrefixLen->super.size_;
  if (v15 < 0 || v15 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v15);
  }
  ++*(&blockCountByPrefixLen->super.size_ + v15 + 1);
  ++self->startBlockCount_;
  v17 = (void *)*((void *)a3 + 8);
  if (!v17
    || (self->totalBlockSuffixBytes_ += (int)[v17 length], (v18 = (void *)*((void *)a3 + 10)) == 0))
  {
LABEL_16:
    JreThrowNullPointerException();
  }
  self->totalBlockStatsBytes_ += (int)[v18 length];
}

- (void)endBlockWithOrgApacheLuceneCodecsBlocktreeSegmentTermsEnumFrame:(id)a3
{
  if (!a3) {
    goto LABEL_20;
  }
  if (*((unsigned char *)a3 + 117))
  {
    uint64_t v5 = (int *)((char *)a3 + 108);
  }
  else
  {
    uint64_t v6 = *((void *)a3 + 18);
    if (!v6) {
      goto LABEL_20;
    }
    uint64_t v5 = (int *)(v6 + 32);
  }
  int v7 = *((_DWORD *)a3 + 27);
  uint64_t v8 = *v5;
  self->totalTermCount_ += v8;
  if (v8) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (v9)
  {
    v18 = new_JavaLangIllegalStateException_init();
    objc_exception_throw(v18);
  }
  BOOL v10 = v7 == v8 || v8 == 0;
  uint64_t v11 = 48;
  if (!v10) {
    uint64_t v11 = 44;
  }
  BOOL v9 = v8 == 0;
  uint64_t v12 = 52;
  if (!v9) {
    uint64_t v12 = v11;
  }
  ++*(_DWORD *)((char *)&self->super.isa + v12);
  ++self->endBlockCount_;
  int v13 = (void *)*((void *)a3 + 8);
  if (!v13
    || (uint64_t v14 = *((void *)a3 + 6),
        uint64_t v15 = *((void *)a3 + 4),
        signed int v16 = [v13 length],
        (v17 = (void *)*((void *)a3 + 10)) == 0))
  {
LABEL_20:
    JreThrowNullPointerException();
  }
  self->totalBlockOtherBytes_ += v14 - (v15 + v16 + (int)[v17 length]);
}

- (void)termWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  self->totalTermBytes_ += *((int *)a3 + 5);
}

- (id)description
{
  v143 = new_JavaIoByteArrayOutputStream_initWithInt_(0x400u);
  if ((atomic_load_explicit(OrgApacheLuceneUtilIOUtils__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v2 = new_JavaIoPrintStream_initWithJavaIoOutputStream_withBoolean_withNSString_(v143, 0, (__CFString *)OrgApacheLuceneUtilIOUtils_UTF_8_);
  v3 = v2;
  if (!v2) {
    JreThrowNullPointerException();
  }
  [(JavaIoPrintStream *)v2 printlnWithNSString:@"  index FST:"];
  [(JavaIoPrintStream *)v3 printlnWithNSString:JreStrcat("$J$", v4, v5, v6, v7, v8, v9, v10, @"    ")];
  [(JavaIoPrintStream *)v3 printlnWithNSString:@"  terms:"];
  [(JavaIoPrintStream *)v3 printlnWithNSString:JreStrcat("$J$", v11, v12, v13, v14, v15, v16, v17, @"    ")];
  if (self->totalTermCount_)
  {
    if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    uint64_t v25 = JavaUtilLocale_ROOT_;
    v149 = JavaLangDouble_valueOfWithDouble_((double)self->totalTermBytes_ / (double)self->totalTermCount_);
    v26 = +[IOSObjectArray arrayWithObjects:&v149 count:1 type:NSObject_class_()];
    NSString_formatWithJavaUtilLocale_withNSString_withNSObjectArray_(v25, @"%.1f", (uint64_t)v26);
    JreStrcat("$$$", v27, v28, v29, v30, v31, v32, v33, @" (");
  }
  [(JavaIoPrintStream *)v3 printlnWithNSString:JreStrcat("$J$$", v18, v19, v20, v21, v22, v23, v24, @"    ")];
  [(JavaIoPrintStream *)v3 printlnWithNSString:@"  blocks:"];
  [(JavaIoPrintStream *)v3 printlnWithNSString:JreStrcat("$I$", v34, v35, v36, v37, v38, v39, v40, @"    ")];
  [(JavaIoPrintStream *)v3 printlnWithNSString:JreStrcat("$I$", v41, v42, v43, v44, v45, v46, v47, @"    ")];
  [(JavaIoPrintStream *)v3 printlnWithNSString:JreStrcat("$I$", v48, v49, v50, v51, v52, v53, v54, @"    ")];
  [(JavaIoPrintStream *)v3 printlnWithNSString:JreStrcat("$I$", v55, v56, v57, v58, v59, v60, v61, @"    ")];
  [(JavaIoPrintStream *)v3 printlnWithNSString:JreStrcat("$I$", v62, v63, v64, v65, v66, v67, v68, @"    ")];
  [(JavaIoPrintStream *)v3 printlnWithNSString:JreStrcat("$I$", v69, v70, v71, v72, v73, v74, v75, @"    ")];
  [(JavaIoPrintStream *)v3 printlnWithNSString:JreStrcat("$I$", v76, v77, v78, v79, v80, v81, v82, @"    ")];
  if (self->totalBlockCount_)
  {
    if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    uint64_t v90 = JavaUtilLocale_ROOT_;
    v148 = JavaLangDouble_valueOfWithDouble_((double)self->totalBlockSuffixBytes_ / (double)self->totalBlockCount_);
    v91 = +[IOSObjectArray arrayWithObjects:&v148 count:1 type:NSObject_class_()];
    NSString_formatWithJavaUtilLocale_withNSString_withNSObjectArray_(v90, @"%.1f", (uint64_t)v91);
    JreStrcat("$$$", v92, v93, v94, v95, v96, v97, v98, @" (");
  }
  [(JavaIoPrintStream *)v3 printlnWithNSString:JreStrcat("$J$$", v83, v84, v85, v86, v87, v88, v89, @"    ")];
  if (self->totalBlockCount_)
  {
    if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    uint64_t v106 = JavaUtilLocale_ROOT_;
    v147 = JavaLangDouble_valueOfWithDouble_((double)self->totalBlockStatsBytes_ / (double)self->totalBlockCount_);
    v107 = +[IOSObjectArray arrayWithObjects:&v147 count:1 type:NSObject_class_()];
    NSString_formatWithJavaUtilLocale_withNSString_withNSObjectArray_(v106, @"%.1f", (uint64_t)v107);
    JreStrcat("$$$", v108, v109, v110, v111, v112, v113, v114, @" (");
  }
  [(JavaIoPrintStream *)v3 printlnWithNSString:JreStrcat("$J$$", v99, v100, v101, v102, v103, v104, v105, @"    ")];
  if (self->totalBlockCount_)
  {
    if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    uint64_t v122 = JavaUtilLocale_ROOT_;
    v146 = JavaLangDouble_valueOfWithDouble_((double)self->totalBlockOtherBytes_ / (double)self->totalBlockCount_);
    v123 = +[IOSObjectArray arrayWithObjects:&v146 count:1 type:NSObject_class_()];
    NSString_formatWithJavaUtilLocale_withNSString_withNSObjectArray_(v122, @"%.1f", (uint64_t)v123);
    JreStrcat("$$$", v124, v125, v126, v127, v128, v129, v130, @" (");
  }
  [(JavaIoPrintStream *)v3 printlnWithNSString:JreStrcat("$J$$", v115, v116, v117, v118, v119, v120, v121, @"    ")];
  if (self->totalBlockCount_)
  {
    [(JavaIoPrintStream *)v3 printlnWithNSString:@"    by prefix length:"];
    blockCountByPrefixLen = self->blockCountByPrefixLen_;
    if (!blockCountByPrefixLen) {
LABEL_33:
    }
      JreThrowNullPointerException();
    uint64_t v132 = 0;
    while (v132 < blockCountByPrefixLen->super.size_)
    {
      if (*(&blockCountByPrefixLen->super.size_ + v132 + 1))
      {
        if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
          objc_opt_class();
        }
        uint64_t v133 = JavaUtilLocale_ROOT_;
        v145 = JavaLangInteger_valueOfWithInt_(v132);
        v134 = +[IOSObjectArray arrayWithObjects:&v145 count:1 type:NSObject_class_()];
        NSString_formatWithJavaUtilLocale_withNSString_withNSObjectArray_(v133, @"%2d", (uint64_t)v134);
        [(JavaIoPrintStream *)v3 printlnWithNSString:JreStrcat("$$$I", v135, v136, v137, v138, v139, v140, v141, @"      ")];
        blockCountByPrefixLen = self->blockCountByPrefixLen_;
      }
      ++v132;
      if (!blockCountByPrefixLen) {
        goto LABEL_33;
      }
    }
  }
  if ((atomic_load_explicit(OrgApacheLuceneUtilIOUtils__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return [(JavaIoByteArrayOutputStream *)v143 toStringWithNSString:OrgApacheLuceneUtilIOUtils_UTF_8_];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsBlocktreeStats;
  [(OrgApacheLuceneCodecsBlocktreeStats *)&v3 dealloc];
}

@end