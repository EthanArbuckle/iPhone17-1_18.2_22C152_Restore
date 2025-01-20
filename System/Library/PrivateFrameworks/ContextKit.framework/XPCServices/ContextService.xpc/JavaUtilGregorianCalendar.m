@interface JavaUtilGregorianCalendar
+ (const)__metadata;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLeapYearWithInt:(int)a3;
- (JavaUtilGregorianCalendar)init;
- (JavaUtilGregorianCalendar)initWithBoolean:(BOOL)a3;
- (JavaUtilGregorianCalendar)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (JavaUtilGregorianCalendar)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7;
- (JavaUtilGregorianCalendar)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8;
- (JavaUtilGregorianCalendar)initWithJavaUtilLocale:(id)a3;
- (JavaUtilGregorianCalendar)initWithJavaUtilTimeZone:(id)a3;
- (JavaUtilGregorianCalendar)initWithJavaUtilTimeZone:(id)a3 withJavaUtilLocale:(id)a4;
- (JavaUtilGregorianCalendar)initWithLong:(int64_t)a3;
- (id)getGregorianChange;
- (int)computeYearAndDayWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (int)daysInMonthWithBoolean:(BOOL)a3 withInt:(int)a4;
- (int)daysInYearWithBoolean:(BOOL)a3 withInt:(int)a4;
- (int)daysInYearWithInt:(int)a3;
- (int)getActualMaximumWithInt:(int)a3;
- (int)getGreatestMinimumWithInt:(int)a3;
- (int)getLeastMaximumWithInt:(int)a3;
- (int)getMaximumWithInt:(int)a3;
- (int)getMinimumWithInt:(int)a3;
- (int)getOffsetWithLong:(int64_t)a3;
- (int)julianError;
- (int)mod7WithLong:(int64_t)a3;
- (int)modWithInt:(int)a3 withInt:(int)a4;
- (int64_t)daysFromBaseYearWithLong:(int64_t)a3;
- (unint64_t)hash;
- (void)addWithInt:(int)a3 withInt:(int)a4;
- (void)computeFields;
- (void)computeTime;
- (void)fullFieldsCalcWithLong:(int64_t)a3 withInt:(int)a4;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)rollWithInt:(int)a3 withBoolean:(BOOL)a4;
- (void)rollWithInt:(int)a3 withInt:(int)a4;
- (void)setGregorianChangeWithJavaUtilDate:(id)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilGregorianCalendar

- (JavaUtilGregorianCalendar)init
{
  id Default = JavaUtilTimeZone_getDefault();
  v4 = (void *)JavaUtilLocale_getDefault();
  JavaUtilGregorianCalendar_initWithJavaUtilTimeZone_withJavaUtilLocale_((uint64_t)self, (uint64_t)Default, v4);
  return self;
}

- (JavaUtilGregorianCalendar)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  return self;
}

- (JavaUtilGregorianCalendar)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7
{
  return self;
}

- (JavaUtilGregorianCalendar)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8
{
  return self;
}

- (JavaUtilGregorianCalendar)initWithLong:(int64_t)a3
{
  return self;
}

- (JavaUtilGregorianCalendar)initWithJavaUtilLocale:(id)a3
{
  id Default = JavaUtilTimeZone_getDefault();
  JavaUtilGregorianCalendar_initWithJavaUtilTimeZone_withJavaUtilLocale_((uint64_t)self, (uint64_t)Default, a3);
  return self;
}

- (JavaUtilGregorianCalendar)initWithJavaUtilTimeZone:(id)a3
{
  id Default = (void *)JavaUtilLocale_getDefault();
  JavaUtilGregorianCalendar_initWithJavaUtilTimeZone_withJavaUtilLocale_((uint64_t)self, (uint64_t)a3, Default);
  return self;
}

- (JavaUtilGregorianCalendar)initWithJavaUtilTimeZone:(id)a3 withJavaUtilLocale:(id)a4
{
  return self;
}

- (JavaUtilGregorianCalendar)initWithBoolean:(BOOL)a3
{
  return self;
}

- (void)addWithInt:(int)a3 withInt:(int)a4
{
  if (!a4) {
    return;
  }
  if (a3 >= 0xF)
  {
    v34 = new_JavaLangIllegalArgumentException_init();
    objc_exception_throw(v34);
  }
  int v5 = a4;
  if (!a3)
  {
    [(JavaUtilCalendar *)self complete];
    fields = self->super.fields_;
    if (fields)
    {
      uint64_t size = fields->super.size_;
      if ((int)size <= 0) {
        IOSArray_throwOutOfBoundsWithMsg(size, 0);
      }
      if (*(&fields->super.size_ + 1) == 1)
      {
        if ((v5 & 0x80000000) == 0) {
          return;
        }
        uint64_t v12 = 0;
      }
      else
      {
        if (v5 < 1) {
          return;
        }
        uint64_t v12 = 1;
      }
      v14 = self;
      uint64_t v15 = 0;
      goto LABEL_36;
    }
    goto LABEL_47;
  }
  if (a3 > 2)
  {
    [(JavaUtilCalendar *)self getTimeInMillis];
    int v13 = 43200000;
    switch(a3)
    {
      case 3:
      case 4:
      case 8:
        int v13 = 604800000;
        goto LABEL_22;
      case 5:
      case 6:
      case 7:
        int v13 = 86400000;
        goto LABEL_22;
      case 9:
LABEL_22:
        id v16 = [(JavaUtilCalendar *)self getTimeZone];
        if (!v16) {
          goto LABEL_47;
        }
        uint64_t v17 = (int)[v16 getRawOffset];
        unsigned int v18 = sub_1001A675C((uint64_t)self, self->super.time_ + v17);
        uint64_t v19 = v17 + v13 * (uint64_t)v5;
        LODWORD(v17) = sub_1001A675C((uint64_t)self, v19 + self->super.time_);
        uint64_t v20 = (int)(v18 - v17);
        if (sub_1001A675C((uint64_t)self, v19 + self->super.time_ + v20) == v17) {
          uint64_t v21 = v20;
        }
        else {
          uint64_t v21 = 0;
        }
        self->super.time_ += v13 * (uint64_t)v5 + v21;
        break;
      case 10:
      case 11:
        int v32 = 3600000;
        goto LABEL_40;
      case 12:
        int v32 = 60000;
        goto LABEL_40;
      case 13:
        int v32 = 1000;
LABEL_40:
        uint64_t v33 = v5 * (uint64_t)v32;
        goto LABEL_42;
      case 14:
        uint64_t v33 = v5;
LABEL_42:
        self->super.time_ += v33;
        break;
      default:
        break;
    }
    self->super.areFieldsSet_ = 0;
    goto LABEL_44;
  }
  [(JavaUtilCalendar *)self complete];
  if (a3 == 2)
  {
    v7 = self->super.fields_;
    if (!v7) {
      goto LABEL_47;
    }
    uint64_t v8 = v7->super.size_;
    if ((int)v8 <= 2) {
      IOSArray_throwOutOfBoundsWithMsg(v8, 2);
    }
    int v9 = v7->buffer_[1] + v5;
    if (v9 < 0)
    {
      int v5 = (v9 - 11) / 12;
      v9 += 12 * (-v9 / 0xCu) + 12;
    }
    else
    {
      int v5 = v9 / 0xCu;
    }
    [(JavaUtilCalendar *)self setWithInt:2 withInt:v9 % 0xCu];
  }
  v22 = self->super.fields_;
  if (!v22) {
LABEL_47:
  }
    JreThrowNullPointerException();
  uint64_t v23 = v22->super.size_;
  if ((int)v23 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v23, 1);
  }
  [(JavaUtilCalendar *)self setWithInt:1 withInt:(v22->buffer_[0] + v5)];
  v24 = self->super.fields_;
  uint64_t v25 = v24->super.size_;
  if ((int)v25 < 2) {
    IOSArray_throwOutOfBoundsWithMsg(v25, 1);
  }
  int v26 = [(JavaUtilGregorianCalendar *)self isLeapYearWithInt:v24->buffer_[0]];
  v27 = self->super.fields_;
  uint64_t v28 = v27->super.size_;
  if ((int)v28 <= 2) {
    IOSArray_throwOutOfBoundsWithMsg(v28, 2);
  }
  uint64_t v29 = sub_1001A66A4(v26, v27->buffer_[1]);
  v30 = self->super.fields_;
  uint64_t v31 = v30->super.size_;
  if ((int)v31 <= 5) {
    IOSArray_throwOutOfBoundsWithMsg(v31, 5);
  }
  if (v30->buffer_[4] <= (int)v29) {
    goto LABEL_44;
  }
  v14 = self;
  uint64_t v15 = 5;
  uint64_t v12 = v29;
LABEL_36:
  [(JavaUtilCalendar *)v14 setWithInt:v15 withInt:v12];
LABEL_44:
  [(JavaUtilCalendar *)self complete];
}

- (void)fullFieldsCalcWithLong:(int64_t)a3 withInt:(int)a4
{
}

- (void)computeFields
{
  id v3 = [(JavaUtilCalendar *)self getTimeZone];
  if (!v3
    || ((v4 = v3,
         ![v3 inDaylightTimeWithJavaUtilDate:new_JavaUtilDate_initWithLong_(self->super.time_)])? (unsigned int v5 = 0): (unsigned int v5 = objc_msgSend(v4, "getDSTSavings")), v6 = objc_msgSend(v4, "getRawOffset"), (fields = self->super.fields_) == 0))
  {
LABEL_14:
    JreThrowNullPointerException();
  }
  int v8 = v6;
  uint64_t size = fields->super.size_;
  if ((int)size <= 16) {
    IOSArray_throwOutOfBoundsWithMsg(size, 16);
  }
  fields->buffer_[15] = v5;
  v10 = self->super.fields_;
  uint64_t v11 = v10->super.size_;
  if ((int)v11 < 16) {
    IOSArray_throwOutOfBoundsWithMsg(v11, 15);
  }
  v10->buffer_[14] = v8;
  sub_1001A69E0((uint64_t)self, self->super.time_, v8);
  for (uint64_t i = 0; i != 17; ++i)
  {
    isSet = self->super.isSet_;
    if (!isSet) {
      goto LABEL_14;
    }
    uint64_t v14 = isSet->super.size_;
    if (i >= v14) {
      IOSArray_throwOutOfBoundsWithMsg(v14, i);
    }
    *((unsigned char *)&isSet->super.size_ + i + 4) = 1;
  }
}

- (void)computeTime
{
  if (![(JavaUtilCalendar *)self isLenient])
  {
    isSet = self->super.isSet_;
    if (!isSet) {
      goto LABEL_324;
    }
    uint64_t size = isSet->super.size_;
    if ((int)size <= 11) {
      IOSArray_throwOutOfBoundsWithMsg(size, 11);
    }
    if (isSet->buffer_[7])
    {
      fields = self->super.fields_;
      if (!fields) {
        goto LABEL_324;
      }
      uint64_t v6 = fields->super.size_;
      if ((int)v6 <= 11) {
        IOSArray_throwOutOfBoundsWithMsg(v6, 11);
      }
      if (fields->buffer_[10] < 0) {
        goto LABEL_422;
      }
      v7 = self->super.fields_;
      uint64_t v8 = v7->super.size_;
      if ((int)v8 <= 11) {
        IOSArray_throwOutOfBoundsWithMsg(v8, 11);
      }
      if (v7->buffer_[10] >= 24) {
        goto LABEL_422;
      }
    }
    else
    {
      int v9 = self->super.isSet_;
      uint64_t v10 = v9->super.size_;
      if ((int)v10 <= 10) {
        IOSArray_throwOutOfBoundsWithMsg(v10, 10);
      }
      if (v9->buffer_[6])
      {
        uint64_t v11 = self->super.fields_;
        if (!v11) {
          goto LABEL_324;
        }
        uint64_t v12 = v11->super.size_;
        if ((int)v12 <= 10) {
          IOSArray_throwOutOfBoundsWithMsg(v12, 10);
        }
        if (v11->buffer_[9] < 0) {
          goto LABEL_422;
        }
        int v13 = self->super.fields_;
        uint64_t v14 = v13->super.size_;
        if ((int)v14 < 11) {
          IOSArray_throwOutOfBoundsWithMsg(v14, 10);
        }
        if (v13->buffer_[9] > 11)
        {
LABEL_422:
          v263 = new_JavaLangIllegalArgumentException_init();
          objc_exception_throw(v263);
        }
      }
    }
    uint64_t v15 = self->super.isSet_;
    uint64_t v16 = v15->super.size_;
    if ((int)v16 <= 12) {
      IOSArray_throwOutOfBoundsWithMsg(v16, 12);
    }
    if (v15->buffer_[8])
    {
      uint64_t v17 = self->super.fields_;
      if (!v17) {
        goto LABEL_324;
      }
      uint64_t v18 = v17->super.size_;
      if ((int)v18 <= 12) {
        IOSArray_throwOutOfBoundsWithMsg(v18, 12);
      }
      if (v17->buffer_[11] < 0) {
        goto LABEL_422;
      }
      uint64_t v19 = self->super.fields_;
      uint64_t v20 = v19->super.size_;
      if ((int)v20 <= 12) {
        IOSArray_throwOutOfBoundsWithMsg(v20, 12);
      }
      if (v19->buffer_[11] >= 60) {
        goto LABEL_422;
      }
    }
    uint64_t v21 = self->super.isSet_;
    uint64_t v22 = v21->super.size_;
    if ((int)v22 <= 13) {
      IOSArray_throwOutOfBoundsWithMsg(v22, 13);
    }
    if (v21->buffer_[9])
    {
      uint64_t v23 = self->super.fields_;
      if (!v23) {
        goto LABEL_324;
      }
      uint64_t v24 = v23->super.size_;
      if ((int)v24 <= 13) {
        IOSArray_throwOutOfBoundsWithMsg(v24, 13);
      }
      if (v23->buffer_[12] < 0) {
        goto LABEL_422;
      }
      uint64_t v25 = self->super.fields_;
      uint64_t v26 = v25->super.size_;
      if ((int)v26 <= 13) {
        IOSArray_throwOutOfBoundsWithMsg(v26, 13);
      }
      if (v25->buffer_[12] >= 60) {
        goto LABEL_422;
      }
    }
    v27 = self->super.isSet_;
    uint64_t v28 = v27->super.size_;
    if ((int)v28 <= 14) {
      IOSArray_throwOutOfBoundsWithMsg(v28, 14);
    }
    if (v27->buffer_[10])
    {
      uint64_t v29 = self->super.fields_;
      if (!v29) {
        goto LABEL_324;
      }
      uint64_t v30 = v29->super.size_;
      if ((int)v30 <= 14) {
        IOSArray_throwOutOfBoundsWithMsg(v30, 14);
      }
      if (v29->buffer_[13] < 0) {
        goto LABEL_422;
      }
      uint64_t v31 = self->super.fields_;
      uint64_t v32 = v31->super.size_;
      if ((int)v32 <= 14) {
        IOSArray_throwOutOfBoundsWithMsg(v32, 14);
      }
      if (v31->buffer_[13] >= 1000) {
        goto LABEL_422;
      }
    }
    uint64_t v33 = self->super.isSet_;
    uint64_t v34 = v33->super.size_;
    if ((int)v34 <= 3) {
      IOSArray_throwOutOfBoundsWithMsg(v34, 3);
    }
    if (*((unsigned char *)&v33->super.size_ + 7))
    {
      v35 = self->super.fields_;
      if (!v35) {
        goto LABEL_324;
      }
      uint64_t v36 = v35->super.size_;
      if ((int)v36 <= 3) {
        IOSArray_throwOutOfBoundsWithMsg(v36, 3);
      }
      if (v35->buffer_[2] < 1) {
        goto LABEL_422;
      }
      v37 = self->super.fields_;
      uint64_t v38 = v37->super.size_;
      if ((int)v38 <= 3) {
        IOSArray_throwOutOfBoundsWithMsg(v38, 3);
      }
      if (v37->buffer_[2] >= 54) {
        goto LABEL_422;
      }
    }
    v39 = self->super.isSet_;
    uint64_t v40 = v39->super.size_;
    if ((int)v40 <= 7) {
      IOSArray_throwOutOfBoundsWithMsg(v40, 7);
    }
    if (v39->buffer_[3])
    {
      v41 = self->super.fields_;
      if (!v41) {
        goto LABEL_324;
      }
      uint64_t v42 = v41->super.size_;
      if ((int)v42 <= 7) {
        IOSArray_throwOutOfBoundsWithMsg(v42, 7);
      }
      if (v41->buffer_[6] < 1) {
        goto LABEL_422;
      }
      v43 = self->super.fields_;
      uint64_t v44 = v43->super.size_;
      if ((int)v44 <= 7) {
        IOSArray_throwOutOfBoundsWithMsg(v44, 7);
      }
      if (v43->buffer_[6] >= 8) {
        goto LABEL_422;
      }
    }
    v45 = self->super.isSet_;
    uint64_t v46 = v45->super.size_;
    if ((int)v46 <= 8) {
      IOSArray_throwOutOfBoundsWithMsg(v46, 8);
    }
    if (v45->buffer_[4])
    {
      v47 = self->super.fields_;
      if (!v47) {
        goto LABEL_324;
      }
      uint64_t v48 = v47->super.size_;
      if ((int)v48 <= 8) {
        IOSArray_throwOutOfBoundsWithMsg(v48, 8);
      }
      if (v47->buffer_[7] < 1) {
        goto LABEL_422;
      }
      v49 = self->super.fields_;
      uint64_t v50 = v49->super.size_;
      if ((int)v50 <= 8) {
        IOSArray_throwOutOfBoundsWithMsg(v50, 8);
      }
      if (v49->buffer_[7] >= 7) {
        goto LABEL_422;
      }
    }
    v51 = self->super.isSet_;
    uint64_t v52 = v51->super.size_;
    if ((int)v52 <= 4) {
      IOSArray_throwOutOfBoundsWithMsg(v52, 4);
    }
    if (v51->buffer_[0])
    {
      v53 = self->super.fields_;
      if (!v53) {
        goto LABEL_324;
      }
      uint64_t v54 = v53->super.size_;
      if ((int)v54 <= 4) {
        IOSArray_throwOutOfBoundsWithMsg(v54, 4);
      }
      if (v53->buffer_[3] < 1) {
        goto LABEL_422;
      }
      v55 = self->super.fields_;
      uint64_t v56 = v55->super.size_;
      if ((int)v56 <= 4) {
        IOSArray_throwOutOfBoundsWithMsg(v56, 4);
      }
      if (v55->buffer_[3] >= 7) {
        goto LABEL_422;
      }
    }
    v57 = self->super.isSet_;
    uint64_t v58 = v57->super.size_;
    if ((int)v58 <= 9) {
      IOSArray_throwOutOfBoundsWithMsg(v58, 9);
    }
    if (v57->buffer_[5])
    {
      v59 = self->super.fields_;
      if (!v59) {
        goto LABEL_324;
      }
      uint64_t v60 = v59->super.size_;
      if ((int)v60 <= 9) {
        IOSArray_throwOutOfBoundsWithMsg(v60, 9);
      }
      if (v59->buffer_[8])
      {
        v61 = self->super.fields_;
        uint64_t v62 = v61->super.size_;
        if ((int)v62 <= 9) {
          IOSArray_throwOutOfBoundsWithMsg(v62, 9);
        }
        if (v61->buffer_[8] != 1) {
          goto LABEL_422;
        }
      }
    }
    v63 = self->super.isSet_;
    uint64_t v64 = v63->super.size_;
    if ((int)v64 <= 10) {
      IOSArray_throwOutOfBoundsWithMsg(v64, 10);
    }
    if (v63->buffer_[6])
    {
      v65 = self->super.fields_;
      if (!v65) {
        goto LABEL_324;
      }
      uint64_t v66 = v65->super.size_;
      if ((int)v66 <= 10) {
        IOSArray_throwOutOfBoundsWithMsg(v66, 10);
      }
      if (v65->buffer_[9] < 0) {
        goto LABEL_422;
      }
      v67 = self->super.fields_;
      uint64_t v68 = v67->super.size_;
      if ((int)v68 < 11) {
        IOSArray_throwOutOfBoundsWithMsg(v68, 10);
      }
      if (v67->buffer_[9] > 11) {
        goto LABEL_422;
      }
    }
    v69 = self->super.isSet_;
    uint64_t v70 = v69->super.size_;
    if ((int)v70 <= 1) {
      IOSArray_throwOutOfBoundsWithMsg(v70, 1);
    }
    v71 = self->super.isSet_;
    if (*((unsigned char *)&v69->super.size_ + 5))
    {
      uint64_t v72 = v69->super.size_;
      if ((int)v72 <= 0) {
        IOSArray_throwOutOfBoundsWithMsg(v72, 0);
      }
      if (*((unsigned char *)&v69->super.size_ + 4))
      {
        v73 = self->super.fields_;
        if (!v73) {
          goto LABEL_324;
        }
        uint64_t v74 = v73->super.size_;
        if ((int)v74 <= 0) {
          IOSArray_throwOutOfBoundsWithMsg(v74, 0);
        }
        if (!*(&v73->super.size_ + 1))
        {
          v75 = self->super.fields_;
          uint64_t v76 = v75->super.size_;
          if ((int)v76 <= 1) {
            IOSArray_throwOutOfBoundsWithMsg(v76, 1);
          }
          if (v75->buffer_[0] < 1) {
            goto LABEL_422;
          }
          v77 = self->super.fields_;
          uint64_t v78 = v77->super.size_;
          if ((int)v78 <= 1) {
            IOSArray_throwOutOfBoundsWithMsg(v78, 1);
          }
          if (v77->buffer_[0] >= 292269055) {
            goto LABEL_422;
          }
        }
      }
      v79 = self->super.fields_;
      if (!v79) {
        goto LABEL_324;
      }
      uint64_t v80 = v79->super.size_;
      if ((int)v80 <= 1) {
        IOSArray_throwOutOfBoundsWithMsg(v80, 1);
      }
      if (v79->buffer_[0] < 1) {
        goto LABEL_422;
      }
      v81 = self->super.fields_;
      uint64_t v82 = v81->super.size_;
      if ((int)v82 <= 1) {
        IOSArray_throwOutOfBoundsWithMsg(v82, 1);
      }
      if (v81->buffer_[0] > 292278994) {
        goto LABEL_422;
      }
      v71 = self->super.isSet_;
    }
    uint64_t v83 = v71->super.size_;
    if ((int)v83 <= 2) {
      IOSArray_throwOutOfBoundsWithMsg(v83, 2);
    }
    if (*((unsigned char *)&v71->super.size_ + 6))
    {
      v84 = self->super.fields_;
      if (!v84) {
        goto LABEL_324;
      }
      uint64_t v85 = v84->super.size_;
      if ((int)v85 <= 2) {
        IOSArray_throwOutOfBoundsWithMsg(v85, 2);
      }
      if (v84->buffer_[1] < 0) {
        goto LABEL_422;
      }
      v86 = self->super.fields_;
      uint64_t v87 = v86->super.size_;
      if ((int)v87 <= 2) {
        IOSArray_throwOutOfBoundsWithMsg(v87, 2);
      }
      if (v86->buffer_[1] >= 12) {
        goto LABEL_422;
      }
    }
  }
  v88 = self->super.isSet_;
  if (!v88) {
    goto LABEL_324;
  }
  uint64_t v89 = v88->super.size_;
  if ((int)v89 <= 11) {
    IOSArray_throwOutOfBoundsWithMsg(v89, 11);
  }
  if (v88->buffer_[7] && self->super.lastTimeFieldSet_ != 10)
  {
    v96 = self->super.fields_;
    if (!v96) {
      goto LABEL_324;
    }
    uint64_t v97 = v96->super.size_;
    if ((int)v97 <= 11) {
      IOSArray_throwOutOfBoundsWithMsg(v97, 11);
    }
    int v95 = v96->buffer_[10];
  }
  else
  {
    v90 = self->super.isSet_;
    uint64_t v91 = v90->super.size_;
    if ((int)v91 <= 10) {
      IOSArray_throwOutOfBoundsWithMsg(v91, 10);
    }
    if (v90->buffer_[6])
    {
      v92 = self->super.fields_;
      if (!v92) {
        goto LABEL_324;
      }
      uint64_t v93 = v92->super.size_;
      if ((int)v93 < 10) {
        IOSArray_throwOutOfBoundsWithMsg(v93, 9);
      }
      int v94 = 12 * v92->buffer_[8];
      if ((int)v93 <= 10) {
        IOSArray_throwOutOfBoundsWithMsg(v93, 10);
      }
      int v95 = self->super.fields_->buffer_[9] + v94;
    }
    else
    {
      int v95 = 0;
    }
  }
  v98 = self->super.isSet_;
  uint64_t v99 = v98->super.size_;
  if ((int)v99 <= 12) {
    IOSArray_throwOutOfBoundsWithMsg(v99, 12);
  }
  uint64_t v100 = 3600000 * v95;
  if (v98->buffer_[8])
  {
    v101 = self->super.fields_;
    if (!v101) {
      goto LABEL_324;
    }
    uint64_t v102 = v101->super.size_;
    if ((int)v102 <= 12) {
      IOSArray_throwOutOfBoundsWithMsg(v102, 12);
    }
    v100 += 60000 * v101->buffer_[11];
  }
  v103 = self->super.isSet_;
  uint64_t v104 = v103->super.size_;
  if ((int)v104 <= 13) {
    IOSArray_throwOutOfBoundsWithMsg(v104, 13);
  }
  if (v103->buffer_[9])
  {
    v105 = self->super.fields_;
    if (!v105) {
      goto LABEL_324;
    }
    uint64_t v106 = v105->super.size_;
    if ((int)v106 <= 13) {
      IOSArray_throwOutOfBoundsWithMsg(v106, 13);
    }
    v100 += 1000 * v105->buffer_[12];
  }
  v107 = self->super.isSet_;
  uint64_t v108 = v107->super.size_;
  if ((int)v108 <= 14) {
    IOSArray_throwOutOfBoundsWithMsg(v108, 14);
  }
  if (v107->buffer_[10])
  {
    v109 = self->super.fields_;
    if (!v109) {
      goto LABEL_324;
    }
    uint64_t v110 = v109->super.size_;
    if ((int)v110 <= 14) {
      IOSArray_throwOutOfBoundsWithMsg(v110, 14);
    }
    v100 += v109->buffer_[13];
  }
  v111 = self->super.isSet_;
  uint64_t v112 = v111->super.size_;
  if ((int)v112 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v112, 1);
  }
  if (*((unsigned char *)&v111->super.size_ + 5))
  {
    v113 = self->super.fields_;
    if (!v113) {
      goto LABEL_324;
    }
    uint64_t v114 = v113->super.size_;
    if ((int)v114 <= 1) {
      IOSArray_throwOutOfBoundsWithMsg(v114, 1);
    }
    uint64_t v115 = v113->buffer_[0];
  }
  else
  {
    uint64_t v115 = 1970;
  }
  v116 = self->super.isSet_;
  uint64_t v117 = v116->super.size_;
  if ((int)v117 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v117, 0);
  }
  if (*((unsigned char *)&v116->super.size_ + 4))
  {
    v118 = self->super.fields_;
    if (!v118) {
      goto LABEL_324;
    }
    uint64_t v119 = v118->super.size_;
    v120 = self->super.fields_;
    if ((int)v119 <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(v119, 0);
    }
    if (*(&v118->super.size_ + 1))
    {
      uint64_t v121 = v118->super.size_;
      if ((int)v121 <= 0) {
        IOSArray_throwOutOfBoundsWithMsg(v121, 0);
      }
      if (*(&v118->super.size_ + 1) != 1) {
        goto LABEL_422;
      }
      v120 = self->super.fields_;
    }
    uint64_t v122 = v120->super.size_;
    if ((int)v122 <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(v122, 0);
    }
    if (*(&v120->super.size_ + 1)) {
      uint64_t v115 = v115;
    }
    else {
      uint64_t v115 = (1 - v115);
    }
  }
  v123 = self->super.isSet_;
  uint64_t v124 = v123->super.size_;
  if ((int)v124 <= 4) {
    IOSArray_throwOutOfBoundsWithMsg(v124, 4);
  }
  v125 = self->super.isSet_;
  if (v123->buffer_[0])
  {
    int v126 = 1;
  }
  else
  {
    uint64_t v127 = v123->super.size_;
    if ((int)v127 <= 8) {
      IOSArray_throwOutOfBoundsWithMsg(v127, 8);
    }
    int v126 = v123->buffer_[4];
  }
  uint64_t v128 = v125->super.size_;
  if ((int)v128 <= 5) {
    IOSArray_throwOutOfBoundsWithMsg(v128, 5);
  }
  if (v125->buffer_[1]) {
    goto LABEL_161;
  }
  v129 = self->super.isSet_;
  uint64_t v130 = v129->super.size_;
  if ((int)v130 <= 2) {
    IOSArray_throwOutOfBoundsWithMsg(v130, 2);
  }
  if (((*((unsigned char *)&v129->super.size_ + 6) == 0) & ~v126) == 0)
  {
LABEL_161:
    int lastDateFieldSet = self->super.lastDateFieldSet_;
    if (lastDateFieldSet != 7)
    {
      if (lastDateFieldSet == 6) {
        goto LABEL_200;
      }
      if (lastDateFieldSet != 3) {
        goto LABEL_182;
      }
    }
    uint64_t v132 = v100;
    v133 = self->super.isSet_;
    uint64_t v134 = v133->super.size_;
    if ((int)v134 <= 3) {
      IOSArray_throwOutOfBoundsWithMsg(v134, 3);
    }
    v135 = self->super.isSet_;
    if (*((unsigned char *)&v133->super.size_ + 7))
    {
      uint64_t v136 = v133->super.size_;
      uint64_t v100 = v132;
      if ((int)v136 <= 7) {
        IOSArray_throwOutOfBoundsWithMsg(v136, 7);
      }
      if (v135->buffer_[3])
      {
        char v137 = v126 ^ 1;
        if (self->super.lastDateFieldSet_ == 3) {
          char v137 = 1;
        }
        if (v137) {
          goto LABEL_200;
        }
        v138 = self->super.isSet_;
        uint64_t v139 = v138->super.size_;
        if ((int)v139 <= 7) {
          IOSArray_throwOutOfBoundsWithMsg(v139, 7);
        }
        if (!v138->buffer_[3]) {
          goto LABEL_200;
        }
LABEL_182:
        uint64_t v266 = v100;
        v145 = self->super.fields_;
        if (!v145) {
          goto LABEL_324;
        }
        char v146 = v126;
        uint64_t v147 = v145->super.size_;
        if ((int)v147 <= 2) {
          IOSArray_throwOutOfBoundsWithMsg(v147, 2);
        }
        int v148 = v145->buffer_[1];
        int v149 = v148 / 12 + v115;
        int v150 = v148 % 12;
        if (v150 >= 0) {
          uint64_t v151 = v150;
        }
        else {
          uint64_t v151 = (v150 + 12);
        }
        LODWORD(v115) = v149 + (v150 >> 31);
        int v152 = [(JavaUtilGregorianCalendar *)self isLeapYearWithInt:v115];
        unint64_t v153 = sub_1001A9AB4((uint64_t)self, (int)v115);
        unint64_t v264 = __PAIR64__(v151, v152);
        int v154 = sub_1001A9C0C(v152, v151);
        v155 = self->super.isSet_;
        uint64_t v156 = v155->super.size_;
        if ((int)v156 <= 5) {
          IOSArray_throwOutOfBoundsWithMsg(v156, 5);
        }
        unint64_t v157 = v153 + v154;
        if (v155->buffer_[1])
        {
          unsigned int v158 = self->super.lastDateFieldSet_;
          if (v158 > 8 || ((1 << v158) & 0x190) == 0) {
            goto LABEL_425;
          }
          v159 = self->super.isSet_;
          uint64_t v160 = v159->super.size_;
          if ((int)v160 <= 7) {
            IOSArray_throwOutOfBoundsWithMsg(v160, 7);
          }
          char v161 = v159->buffer_[3] ? v146 : 0;
          if ((v161 & 1) == 0)
          {
LABEL_425:
            if (![(JavaUtilCalendar *)self isLenient])
            {
              v192 = self->super.fields_;
              uint64_t v193 = v192->super.size_;
              if ((int)v193 <= 5) {
                IOSArray_throwOutOfBoundsWithMsg(v193, 5);
              }
              if (v192->buffer_[4] < 1) {
                goto LABEL_422;
              }
              v194 = self->super.fields_;
              uint64_t v195 = v194->super.size_;
              if ((int)v195 <= 5) {
                IOSArray_throwOutOfBoundsWithMsg(v195, 5);
              }
              int v196 = v194->buffer_[4];
              if (v196 > (int)sub_1001A66A4(v265, HIDWORD(v265))) {
                goto LABEL_422;
              }
            }
            v197 = self->super.fields_;
            uint64_t v198 = v197->super.size_;
            if ((int)v198 <= 5) {
              IOSArray_throwOutOfBoundsWithMsg(v198, 5);
            }
            v157 += v197->buffer_[4] - 1;
            goto LABEL_317;
          }
        }
        v162 = self->super.isSet_;
        uint64_t v163 = v162->super.size_;
        if ((int)v163 <= 7) {
          IOSArray_throwOutOfBoundsWithMsg(v163, 7);
        }
        if (v162->buffer_[3])
        {
          v164 = self->super.fields_;
          uint64_t v165 = v164->super.size_;
          if ((int)v165 <= 7) {
            IOSArray_throwOutOfBoundsWithMsg(v165, 7);
          }
          unsigned int v166 = v164->buffer_[6];
        }
        else
        {
          unsigned int v166 = [(JavaUtilCalendar *)self getFirstDayOfWeek];
        }
        v199 = self->super.isSet_;
        if (v199->super.size_ <= 4) {
          IOSArray_throwOutOfBoundsWithMsg(v199->super.size_, 4);
        }
        signed int v200 = v166 - 1;
        if (v199->buffer_[0] && self->super.lastDateFieldSet_ != 8)
        {
          uint64_t v212 = v157 - 3 - ([(JavaUtilCalendar *)self getFirstDayOfWeek] - 1);
          if ((int)v212 % 7 < 0 && v212 < 0) {
            int v214 = (int)v212 % 7 + 7;
          }
          else {
            int v214 = (int)v212 % 7;
          }
          v215 = self->super.fields_;
          uint64_t v216 = v215->super.size_;
          if ((int)v216 <= 4) {
            IOSArray_throwOutOfBoundsWithMsg(v216, 4);
          }
          int v210 = v215->buffer_[3];
          uint64_t v217 = v214 + v200 - (v157 - 3);
          int v218 = (int)v217 % 7;
          BOOL v219 = (int)v217 % 7 < 0 && v217 < 0;
          int v220 = v218 + 7;
          if (!v219) {
            int v220 = v218;
          }
          int v211 = v220 - v214 - v210;
        }
        else
        {
          v201 = self->super.isSet_;
          uint64_t v202 = v201->super.size_;
          if ((int)v202 <= 8) {
            IOSArray_throwOutOfBoundsWithMsg(v202, 8);
          }
          if (!v201->buffer_[4])
          {
            v228 = self->super.isSet_;
            uint64_t v229 = v228->super.size_;
            if ((int)v229 <= 7) {
              IOSArray_throwOutOfBoundsWithMsg(v229, 7);
            }
            if (v228->buffer_[3])
            {
              uint64_t v230 = v157 - 3 - ([(JavaUtilCalendar *)self getFirstDayOfWeek] - 1);
              int v231 = (int)v230 % 7;
              BOOL v232 = (int)v230 % 7 < 0 && v230 < 0;
              int v233 = v231 + 7;
              if (!v232) {
                int v233 = v231;
              }
              uint64_t v234 = v233 + v200 - (v157 - 3);
              int v235 = (int)v234 % 7;
              if ((int)v234 % 7 < 0 && v234 < 0) {
                v235 += 7;
              }
              int v237 = v235 - v233;
              int v238 = (char)(v237
                          - 7
                          * (((char)((unsigned __int16)(147 * (char)v237) >> 8) >> 2)
                           + ((((unsigned __int16)(147 * (char)v237) >> 8) & 0x80) >> 7)));
              if ((v237 & v238) >= 0) {
                int v239 = (char)(v237
              }
                            - 7
                            * (((char)((unsigned __int16)(147 * (char)v237) >> 8) >> 2)
                             + ((((unsigned __int16)(147 * (char)v237) >> 8) & 0x80) >> 7)));
              else {
                int v239 = v238 + 7;
              }
              v157 += v239;
            }
            goto LABEL_317;
          }
          v203 = self->super.fields_;
          uint64_t v204 = v203->super.size_;
          if ((int)v204 <= 8) {
            IOSArray_throwOutOfBoundsWithMsg(v204, 8);
          }
          if (v203->buffer_[7] < 0)
          {
            int v250 = sub_1001A66A4(v264, HIDWORD(v264));
            int v251 = sub_1001A66A4(v264, HIDWORD(v264));
            int v252 = (v200 - (int)v157 - v251 + 3) % 7;
            BOOL v253 = v252 < 0 && (uint64_t)(v200 - v157 + -v251 + 3) < 0;
            int v254 = v252 + 7;
            if (!v253) {
              int v254 = (v200 - (int)v157 - v251 + 3) % 7;
            }
            v255 = self->super.fields_;
            uint64_t v256 = v255->super.size_;
            if ((int)v256 <= 8) {
              IOSArray_throwOutOfBoundsWithMsg(v256, 8);
            }
            int v221 = v254 + v250 - v255->buffer_[7] + 8 * v255->buffer_[7];
            goto LABEL_316;
          }
          uint64_t v205 = v200 - v157 + 3;
          if ((int)v205 % 7 < 0 && v205 < 0) {
            int v207 = (int)v205 % 7 + 7;
          }
          else {
            int v207 = (int)v205 % 7;
          }
          v208 = self->super.fields_;
          uint64_t v209 = v208->super.size_;
          if ((int)v209 <= 8) {
            IOSArray_throwOutOfBoundsWithMsg(v209, 8);
          }
          int v210 = v208->buffer_[7];
          int v211 = v207 - v210;
        }
        int v221 = v211 + 8 * v210 - 7;
LABEL_316:
        v157 += v221;
        uint64_t v100 = v266;
        goto LABEL_317;
      }
      v135 = self->super.isSet_;
    }
    else
    {
      uint64_t v100 = v132;
    }
    uint64_t v140 = v135->super.size_;
    if ((int)v140 <= 6) {
      IOSArray_throwOutOfBoundsWithMsg(v140, 6);
    }
    if (!v135->buffer_[2]) {
      goto LABEL_182;
    }
    v141 = self->super.isSet_;
    uint64_t v142 = v141->super.size_;
    if ((int)v142 <= 5) {
      IOSArray_throwOutOfBoundsWithMsg(v142, 5);
    }
    if (v141->buffer_[1])
    {
      v143 = self->super.isSet_;
      uint64_t v144 = v143->super.size_;
      if ((int)v144 <= 2) {
        IOSArray_throwOutOfBoundsWithMsg(v144, 2);
      }
      if (*((unsigned char *)&v143->super.size_ + 6)) {
        goto LABEL_182;
      }
    }
  }
LABEL_200:
  v167 = self->super.isSet_;
  uint64_t v168 = v167->super.size_;
  if ((int)v168 <= 3) {
    IOSArray_throwOutOfBoundsWithMsg(v168, 3);
  }
  if (*((unsigned char *)&v167->super.size_ + 7) && self->super.lastDateFieldSet_ != 6)
  {
    v179 = self->super.isSet_;
    uint64_t v180 = v179->super.size_;
    if ((int)v180 <= 6) {
      IOSArray_throwOutOfBoundsWithMsg(v180, 6);
    }
    if (v179->buffer_[2])
    {
      v181 = self->super.isSet_;
      uint64_t v182 = v181->super.size_;
      if ((int)v182 <= 7) {
        IOSArray_throwOutOfBoundsWithMsg(v182, 7);
      }
      BOOL v183 = v181->buffer_[3];
      unint64_t v157 = sub_1001A9AB4((uint64_t)self, (int)v115);
      if (!v183) {
        goto LABEL_204;
      }
    }
    else
    {
      unint64_t v157 = sub_1001A9AB4((uint64_t)self, (int)v115);
    }
    v222 = self->super.isSet_;
    uint64_t v223 = v222->super.size_;
    if ((int)v223 <= 7) {
      IOSArray_throwOutOfBoundsWithMsg(v223, 7);
    }
    if (v222->buffer_[3])
    {
      v224 = self->super.fields_;
      if (!v224) {
        goto LABEL_324;
      }
      uint64_t v225 = v100;
      uint64_t v226 = v224->super.size_;
      if ((int)v226 <= 7) {
        IOSArray_throwOutOfBoundsWithMsg(v226, 7);
      }
      unsigned int v227 = v224->buffer_[6];
    }
    else
    {
      uint64_t v225 = v100;
      unsigned int v227 = [(JavaUtilCalendar *)self getFirstDayOfWeek];
    }
    uint64_t v240 = v157 - 3 - ([(JavaUtilCalendar *)self getFirstDayOfWeek] - 1);
    if ((int)v240 % 7 < 0 && v240 < 0) {
      int v242 = (int)v240 % 7 + 7;
    }
    else {
      int v242 = (int)v240 % 7;
    }
    v243 = self->super.fields_;
    if (!v243) {
      goto LABEL_324;
    }
    unsigned int v244 = v227 - 1;
    uint64_t v245 = v243->super.size_;
    if ((int)v245 <= 3) {
      IOSArray_throwOutOfBoundsWithMsg(v245, 3);
    }
    uint64_t v246 = (int)(v244 + v242) - (v157 - 3);
    int v247 = (int)v246 % 7;
    BOOL v248 = (int)v246 % 7 < 0 && v246 < 0;
    int v249 = v247 + 7;
    if (!v248) {
      int v249 = v247;
    }
    v157 += v249 - v242 - v243->buffer_[2] + 8 * v243->buffer_[2] - 7;
    if (7 - v242 < [(JavaUtilCalendar *)self getMinimalDaysInFirstWeek]) {
      v157 += 7;
    }
    uint64_t v100 = v225;
    goto LABEL_317;
  }
  unint64_t v157 = sub_1001A9AB4((uint64_t)self, (int)v115);
LABEL_204:
  v169 = self->super.isSet_;
  uint64_t v170 = v169->super.size_;
  if ((int)v170 <= 6) {
    IOSArray_throwOutOfBoundsWithMsg(v170, 6);
  }
  if (v169->buffer_[2])
  {
    if (![(JavaUtilCalendar *)self isLenient])
    {
      v171 = self->super.fields_;
      if (!v171) {
        goto LABEL_324;
      }
      uint64_t v172 = v171->super.size_;
      if ((int)v172 <= 6) {
        IOSArray_throwOutOfBoundsWithMsg(v172, 6);
      }
      if (v171->buffer_[5] < 1) {
        goto LABEL_422;
      }
      v173 = self->super.fields_;
      uint64_t v174 = v173->super.size_;
      if ((int)v174 <= 6) {
        IOSArray_throwOutOfBoundsWithMsg(v174, 6);
      }
      int v175 = v173->buffer_[5];
      int v176 = [(JavaUtilGregorianCalendar *)self isLeapYearWithInt:v115] ? 366 : 365;
      if (v175 > v176) {
        goto LABEL_422;
      }
    }
    v177 = self->super.fields_;
    if (v177)
    {
      uint64_t v178 = v177->super.size_;
      if ((int)v178 <= 6) {
        IOSArray_throwOutOfBoundsWithMsg(v178, 6);
      }
      v157 += v177->buffer_[5] - 1;
      goto LABEL_317;
    }
LABEL_324:
    JreThrowNullPointerException();
  }
  v184 = self->super.isSet_;
  uint64_t v185 = v184->super.size_;
  if ((int)v185 <= 7) {
    IOSArray_throwOutOfBoundsWithMsg(v185, 7);
  }
  if (v184->buffer_[3])
  {
    v186 = self->super.fields_;
    if (!v186) {
      goto LABEL_324;
    }
    uint64_t v187 = v186->super.size_;
    if ((int)v187 <= 7) {
      IOSArray_throwOutOfBoundsWithMsg(v187, 7);
    }
    uint64_t v188 = v186->buffer_[6] - 1 - v157 + 3;
    uint64_t v189 = v188 % 7;
    BOOL v190 = v188 % 7 < 0 && v188 < 0;
    uint64_t v191 = v189 + 7;
    if (!v190) {
      uint64_t v191 = v189;
    }
    v157 += v191;
  }
LABEL_317:
  self->super.lastDateFieldSet_ = 0;
  uint64_t v257 = v100 + 86400000 * v157;
  if (v115 == self->changeYear_)
  {
    int v258 = (int)v115 / 100 + (int)v115 / -400 - 2;
    if (v257 >= self->gregorianCutover_ + 86400000 * v258) {
      v257 -= 86400000 * v258;
    }
  }
  signed int v259 = sub_1001A675C((uint64_t)self, v257);
  id v260 = [(JavaUtilCalendar *)self getTimeZone];
  if (!v260) {
    goto LABEL_324;
  }
  uint64_t v261 = v257 - v259 + (int)[v260 getRawOffset];
  int64_t v262 = v257 - (int)sub_1001A675C((uint64_t)self, v261);
  self->super.time_ = v262;
  if (v261 != v262)
  {
    [(JavaUtilGregorianCalendar *)self computeFields];
    self->super.areFieldsSet_ = 1;
  }
}

- (int)computeYearAndDayWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  return sub_1001A9CD0((uint64_t)self, a3, a4);
}

- (int64_t)daysFromBaseYearWithLong:(int64_t)a3
{
  return sub_1001A9AB4((uint64_t)self, a3);
}

- (int)daysInMonthWithBoolean:(BOOL)a3 withInt:(int)a4
{
  return sub_1001A66A4(a3, *(uint64_t *)&a4);
}

- (int)daysInYearWithInt:(int)a3
{
  return sub_1001A9ED4(self, *(uint64_t *)&a3);
}

- (int)daysInYearWithBoolean:(BOOL)a3 withInt:(int)a4
{
  return sub_1001A9C0C(a3, *(uint64_t *)&a4);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a3 == self)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)JavaUtilGregorianCalendar;
      BOOL v5 = [(JavaUtilCalendar *)&v8 isEqual:a3];
      if (v5)
      {
        int64_t gregorianCutover = self->gregorianCutover_;
        objc_opt_class();
        if (!a3) {
          JreThrowNullPointerException();
        }
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          JreThrowClassCastException();
        }
        LOBYTE(v5) = gregorianCutover == *((void *)a3 + 10);
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (int)getActualMaximumWithInt:(int)a3
{
  if (!qword_100560A78) {
    goto LABEL_32;
  }
  uint64_t v5 = *(unsigned int *)(qword_100560A78 + 8);
  if (a3 < 0 || (int)v5 <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(v5, *(uint64_t *)&a3);
  }
  if (!qword_100560A80) {
LABEL_32:
  }
    JreThrowNullPointerException();
  int v6 = *(_DWORD *)(qword_100560A78 + 12 + 4 * a3);
  uint64_t v7 = *(unsigned int *)(qword_100560A80 + 8);
  if (a3 < 0 || (int)v7 <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(v7, *(uint64_t *)&a3);
  }
  if (v6 != *(_DWORD *)(qword_100560A80 + 12 + 4 * a3))
  {
    [(JavaUtilCalendar *)self complete];
    int v6 = 0;
    int64_t time = self->super.time_;
    switch(a3)
    {
      case 1:
        id v9 = [(JavaUtilCalendar *)self clone];
        objc_opt_class();
        if (!v9)
        {
          [(JavaUtilCalendar *)self getWithInt:0];
          JreThrowNullPointerException();
        }
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          JreThrowClassCastException();
        }
        if ([(JavaUtilCalendar *)self getWithInt:0] == 1) {
          unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v10 = 0x8000000000000000;
        }
        [v9 setTimeInMillisWithLong:v10];
        unsigned int v11 = [v9 getWithInt:1];
        objc_msgSend(v9, "setWithInt:withInt:", 1, -[JavaUtilCalendar getWithInt:](self, "getWithInt:", 1));
        int v6 = v11 - [v9 beforeWithId:self];
        goto LABEL_30;
      case 3:
        [(JavaUtilCalendar *)self setWithInt:5 withInt:31];
        [(JavaUtilCalendar *)self setWithInt:2 withInt:11];
        int v6 = [(JavaUtilCalendar *)self getWithInt:3];
        if (v6 != 1) {
          goto LABEL_20;
        }
        [(JavaUtilCalendar *)self setWithInt:5 withInt:24];
        uint64_t v12 = self;
        uint64_t v13 = 3;
LABEL_19:
        int v6 = [(JavaUtilCalendar *)v12 getWithInt:v13];
LABEL_20:
        self->super.areFieldsSet_ = 0;
LABEL_30:
        self->super.time_ = time;
        return v6;
      case 4:
        [(JavaUtilCalendar *)self setWithInt:5 withInt:sub_1001A9DF0(self)];
        uint64_t v12 = self;
        uint64_t v13 = 4;
        goto LABEL_19;
      case 5:
        return sub_1001A9DF0(self);
      case 6:
        fields = self->super.fields_;
        if (!fields) {
          goto LABEL_32;
        }
        uint64_t size = fields->super.size_;
        if ((int)size <= 1) {
          IOSArray_throwOutOfBoundsWithMsg(size, 1);
        }
        uint64_t v19 = fields->buffer_[0];
        return sub_1001A9ED4(self, v19);
      case 8:
        unsigned int v14 = [(JavaUtilCalendar *)self getWithInt:8];
        int v15 = sub_1001A9DF0(self);
        int v6 = (v15 - [(JavaUtilCalendar *)self getWithInt:5]) / 7 + v14;
        goto LABEL_30;
      case 16:
        int v6 = [(JavaUtilGregorianCalendar *)self getMaximumWithInt:16];
        goto LABEL_30;
      default:
        goto LABEL_30;
    }
  }
  return v6;
}

- (int)getGreatestMinimumWithInt:(int)a3
{
  if (!qword_100560A88) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *(unsigned int *)(qword_100560A88 + 8);
  if (a3 < 0 || (int)v3 <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(v3, *(uint64_t *)&a3);
  }
  return *(_DWORD *)(qword_100560A88 + 12 + 4 * a3);
}

- (id)getGregorianChange
{
  v2 = new_JavaUtilDate_initWithLong_(self->gregorianCutover_);
  return v2;
}

- (int)getLeastMaximumWithInt:(int)a3
{
  if (a3 != 3 || self->gregorianCutover_ == -12219292800000)
  {
    if (!qword_100560A80) {
      JreThrowNullPointerException();
    }
    uint64_t v7 = *(unsigned int *)(qword_100560A80 + 8);
    if (a3 < 0 || (int)v7 <= a3) {
      IOSArray_throwOutOfBoundsWithMsg(v7, *(uint64_t *)&a3);
    }
    return *(_DWORD *)(qword_100560A80 + 12 + 4 * a3);
  }
  else
  {
    int64_t time = self->super.time_;
    [(JavaUtilCalendar *)self setTimeInMillisWithLong:self->gregorianCutover_];
    int v5 = [(JavaUtilGregorianCalendar *)self getActualMaximumWithInt:3];
    [(JavaUtilCalendar *)self setTimeInMillisWithLong:time];
    return v5;
  }
}

- (int)getMaximumWithInt:(int)a3
{
  if (!qword_100560A78) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *(unsigned int *)(qword_100560A78 + 8);
  if (a3 < 0 || (int)v3 <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(v3, *(uint64_t *)&a3);
  }
  return *(_DWORD *)(qword_100560A78 + 12 + 4 * a3);
}

- (int)getMinimumWithInt:(int)a3
{
  if (!qword_100560A88) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *(unsigned int *)(qword_100560A88 + 8);
  if (a3 < 0 || (int)v3 <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(v3, *(uint64_t *)&a3);
  }
  return *(_DWORD *)(qword_100560A88 + 12 + 4 * a3);
}

- (int)getOffsetWithLong:(int64_t)a3
{
  return sub_1001A675C((uint64_t)self, a3);
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilGregorianCalendar;
  return (int)((HIDWORD(self->gregorianCutover_) ^ LODWORD(self->gregorianCutover_))
             + [(JavaUtilCalendar *)&v3 hash]);
}

- (BOOL)isLeapYearWithInt:(int)a3
{
  int changeYear = self->changeYear_;
  BOOL v4 = changeYear >= a3;
  if ((a3 & 3) != 0) {
    BOOL v4 = 0;
  }
  HIDWORD(v6) = -1030792151 * a3 + 85899344;
  LODWORD(v6) = HIDWORD(v6);
  unsigned int v5 = v6 >> 2;
  LODWORD(v6) = HIDWORD(v6);
  BOOL v7 = (v6 >> 4) < 0xA3D70B;
  BOOL v8 = v5 > 0x28F5C28 || v7;
  if (changeYear < a3 && (a3 & 3) == 0) {
    return v8;
  }
  else {
    return v4;
  }
}

- (int)julianError
{
  return self->changeYear_ / 100 + self->changeYear_ / -400 - 2;
}

- (int)modWithInt:(int)a3 withInt:(int)a4
{
  return (a4 & (((a3 % a4) & a3) >> 31)) + a3 % a4;
}

- (int)mod7WithLong:(int64_t)a3
{
  if ((int)a3 % 7 < 0 && a3 < 0) {
    return (int)a3 % 7 + 7;
  }
  else {
    return (int)a3 % 7;
  }
}

- (void)rollWithInt:(int)a3 withInt:(int)a4
{
  if (a4)
  {
    uint64_t v4 = *(void *)&a3;
    if (a3 >= 0xF)
    {
      v69 = new_JavaLangIllegalArgumentException_init();
      objc_exception_throw(v69);
    }
    [(JavaUtilCalendar *)self complete];
    switch((int)v4)
    {
      case 0:
      case 2:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
        fields = self->super.fields_;
        if (!fields) {
          goto LABEL_73;
        }
        uint64_t size = fields->super.size_;
        if ((int)size <= (int)v4) {
          IOSArray_throwOutOfBoundsWithMsg(size, v4);
        }
        if (!qword_100560A78) {
          goto LABEL_73;
        }
        int v9 = *(&fields->super.size_ + v4 + 1) + a4;
        uint64_t v10 = *(unsigned int *)(qword_100560A78 + 8);
        if ((int)v10 <= (int)v4) {
          IOSArray_throwOutOfBoundsWithMsg(v10, v4);
        }
        int v11 = *(_DWORD *)(qword_100560A78 + 12 + 4 * v4) + 1;
        [(JavaUtilCalendar *)self setWithInt:v4 withInt:(v11 & (((v9 % v11) & v9) >> 31)) + v9 % v11];
        if (v4 == 9)
        {
          self->super.lastTimeFieldSet_ = 10;
        }
        else if (v4 == 2)
        {
          uint64_t v12 = self->super.fields_;
          uint64_t v13 = v12->super.size_;
          if ((int)v13 <= 5) {
            IOSArray_throwOutOfBoundsWithMsg(v13, 5);
          }
          int v14 = v12->buffer_[4];
          if (v14 > (int)sub_1001A9DF0(self))
          {
            uint64_t v15 = sub_1001A9DF0(self);
            uint64_t v16 = self;
            uint64_t v17 = 5;
            goto LABEL_69;
          }
        }
        goto LABEL_70;
      case 1:
        if (!qword_100560A78) {
          goto LABEL_73;
        }
        uint64_t v18 = *(unsigned int *)(qword_100560A78 + 8);
        if ((int)v18 <= 1) {
          IOSArray_throwOutOfBoundsWithMsg(v18, 1);
        }
        int v19 = *(_DWORD *)(qword_100560A78 + 16);
        goto LABEL_53;
      case 3:
        uint64_t v20 = self->super.fields_;
        if (!v20) {
          goto LABEL_73;
        }
        uint64_t v21 = v20->super.size_;
        if ((int)v21 <= 1) {
          IOSArray_throwOutOfBoundsWithMsg(v21, 1);
        }
        int v22 = sub_1001A9ED4(self, v20->buffer_[0]);
        uint64_t v23 = (unsigned int *)self->super.fields_;
        uint64_t v24 = v23[2];
        if ((int)v24 <= 7) {
          IOSArray_throwOutOfBoundsWithMsg(v24, 7);
        }
        unsigned int v25 = v23[10];
        unsigned int v26 = v23[9];
        signed int v27 = v25 - [(JavaUtilCalendar *)self getFirstDayOfWeek] - v26 + 1;
        if (((v27 % 7) & v27) < 0 != v28) {
          int v29 = v27 % 7 + 7;
        }
        else {
          int v29 = v27 % 7;
        }
        int v30 = (unint64_t)(2454267027 * (v22 + v29 - 1)) >> 32;
        int v31 = (v30 >> 2) + (v30 >> 31);
        uint64_t v32 = self->super.fields_;
        uint64_t v33 = v32->super.size_;
        if ((int)v33 <= 3) {
          IOSArray_throwOutOfBoundsWithMsg(v33, 3);
        }
        int v34 = ((v31 + 1) & (((a4 + v32->buffer_[2] - 1) & ((a4 + v32->buffer_[2] - 1) % (v31 + 1))) >> 31))
            + (a4 + v32->buffer_[2] - 1) % (v31 + 1);
        uint64_t v35 = (v34 + 1);
        if (v34 == v31)
        {
          uint64_t v36 = self->super.fields_;
          uint64_t v37 = v36->super.size_;
          if ((int)v37 <= 3) {
            IOSArray_throwOutOfBoundsWithMsg(v37, 3);
          }
          int v38 = 7 * (v35 - v36->buffer_[2]);
          if ((int)v37 <= 6) {
            IOSArray_throwOutOfBoundsWithMsg(v37, 6);
          }
          if (self->super.fields_->buffer_[5] <= v38) {
            goto LABEL_31;
          }
          v39 = self->super.fields_;
          uint64_t v40 = v39->super.size_;
          if ((int)v40 <= 6) {
            IOSArray_throwOutOfBoundsWithMsg(v40, 6);
          }
          if (v39->buffer_[5] + v38 <= v22)
          {
LABEL_31:
            uint64_t v16 = self;
            uint64_t v17 = 3;
            uint64_t v15 = (v30 >> 2) + (v30 >> 31);
            goto LABEL_69;
          }
        }
        else
        {
          if (v34)
          {
            uint64_t v16 = self;
            uint64_t v17 = 3;
            goto LABEL_61;
          }
          uint64_t v66 = self->super.fields_->super.size_;
          if ((int)v66 <= 6) {
            IOSArray_throwOutOfBoundsWithMsg(v66, 6);
          }
        }
        uint64_t v16 = self;
        uint64_t v17 = 3;
        goto LABEL_68;
      case 4:
        uint64_t v41 = sub_1001A9DF0(self);
        uint64_t v42 = (unsigned int *)self->super.fields_;
        if (!v42) {
          goto LABEL_73;
        }
        uint64_t v43 = v41;
        uint64_t v44 = v42[2];
        if ((int)v44 < 8) {
          IOSArray_throwOutOfBoundsWithMsg(v44, 7);
        }
        unsigned int v45 = v42[10];
        unsigned int v46 = v42[8];
        signed int v47 = v45 - [(JavaUtilCalendar *)self getFirstDayOfWeek] - v46 + 1;
        if (((v47 % 7) & v47) < 0 != v28) {
          int v48 = v47 % 7 + 7;
        }
        else {
          int v48 = v47 % 7;
        }
        unsigned int v49 = ((18725 * (__int16)(v43 + v48 - 1)) >> 17) + ((18725 * (__int16)(v43 + v48 - 1)) >> 31);
        uint64_t v50 = self->super.fields_;
        uint64_t v51 = v50->super.size_;
        if ((int)v51 < 5) {
          IOSArray_throwOutOfBoundsWithMsg(v51, 4);
        }
        int v52 = ((v49 + 1) & (((a4 + v50->buffer_[3] - 1) & ((a4 + v50->buffer_[3] - 1) % (int)(v49 + 1))) >> 31))
            + (a4 + v50->buffer_[3] - 1) % (int)(v49 + 1);
        uint64_t v35 = (v52 + 1);
        if (v52 == v49)
        {
          v53 = (unsigned int *)self->super.fields_;
          uint64_t v54 = v53[2];
          if ((int)v54 <= 5) {
            IOSArray_throwOutOfBoundsWithMsg(v54, 5);
          }
          if ((int)(v53[8] - (v35 - v53[7]) + 8 * (v35 - v53[7])) > (int)v43)
          {
            uint64_t v16 = self;
            uint64_t v17 = 5;
            uint64_t v15 = v43;
            goto LABEL_69;
          }
          goto LABEL_60;
        }
        if (v52)
        {
LABEL_60:
          uint64_t v16 = self;
          uint64_t v17 = 4;
LABEL_61:
          uint64_t v15 = v35;
          goto LABEL_69;
        }
        v67 = self->super.fields_;
        uint64_t v68 = v67->super.size_;
        if ((int)v68 < 6) {
          IOSArray_throwOutOfBoundsWithMsg(v68, 5);
        }
        uint64_t v16 = self;
        if (~v67->buffer_[4] + v67->buffer_[4] + (v67->buffer_[4] - 1) % 7 + v48 + 1 <= 6) {
          uint64_t v17 = 4;
        }
        else {
          uint64_t v17 = 5;
        }
LABEL_68:
        uint64_t v15 = 1;
LABEL_69:
        [(JavaUtilCalendar *)v16 setWithInt:v17 withInt:v15];
LABEL_70:
        [(JavaUtilCalendar *)self complete];
        break;
      case 5:
        int v19 = sub_1001A9DF0(self);
        goto LABEL_53;
      case 6:
        v55 = self->super.fields_;
        if (!v55) {
          goto LABEL_73;
        }
        uint64_t v56 = v55->super.size_;
        if ((int)v56 <= 1) {
          IOSArray_throwOutOfBoundsWithMsg(v56, 1);
        }
        int v19 = sub_1001A9ED4(self, v55->buffer_[0]);
        goto LABEL_53;
      case 7:
        if (!qword_100560A78) {
          goto LABEL_73;
        }
        uint64_t v57 = *(unsigned int *)(qword_100560A78 + 8);
        if ((int)v57 <= 7) {
          IOSArray_throwOutOfBoundsWithMsg(v57, 7);
        }
        int v19 = *(_DWORD *)(qword_100560A78 + 40);
        self->super.lastDateFieldSet_ = 4;
        goto LABEL_53;
      case 8:
        uint64_t v58 = self->super.fields_;
        if (!v58) {
          goto LABEL_73;
        }
        uint64_t v59 = v58->super.size_;
        if ((int)v59 <= 5) {
          IOSArray_throwOutOfBoundsWithMsg(v59, 5);
        }
        int v60 = v58->buffer_[4];
        int v61 = sub_1001A9DF0(self);
        uint64_t v62 = self->super.fields_;
        uint64_t v63 = v62->super.size_;
        if ((int)v63 <= 5) {
          IOSArray_throwOutOfBoundsWithMsg(v63, 5);
        }
        int v19 = (~((v61 - v62->buffer_[4]) % 7) + v60 + v61 - v62->buffer_[4]) / 7 + 1;
LABEL_53:
        if (v19 == -1) {
          goto LABEL_70;
        }
        uint64_t v64 = self->super.fields_;
        if (!v64) {
LABEL_73:
        }
          JreThrowNullPointerException();
        if (v64->super.size_ <= (int)v4) {
          IOSArray_throwOutOfBoundsWithMsg(v64->super.size_, v4);
        }
        int v65 = a4 + *(&v64->super.size_ + v4 + 1) - 1;
        uint64_t v15 = v65 % v19 + (v19 & ((v65 & (v65 % v19)) >> 31)) + 1;
        uint64_t v16 = self;
        uint64_t v17 = v4;
        goto LABEL_69;
      default:
        goto LABEL_70;
    }
  }
}

- (void)rollWithInt:(int)a3 withBoolean:(BOOL)a4
{
  if (a4) {
    [(JavaUtilGregorianCalendar *)self rollWithInt:*(void *)&a3 withInt:1];
  }
  else {
    [(JavaUtilGregorianCalendar *)self rollWithInt:*(void *)&a3 withInt:0xFFFFFFFFLL];
  }
}

- (void)setGregorianChangeWithJavaUtilDate:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  self->gregorianCutover_ = (int64_t)[a3 getTime];
  id TimeZoneWithNSString = JavaUtilTimeZone_getTimeZoneWithNSString_(@"GMT");
  unint64_t v6 = [JavaUtilGregorianCalendar alloc];
  id Default = (void *)JavaUtilLocale_getDefault();
  JavaUtilGregorianCalendar_initWithJavaUtilTimeZone_withJavaUtilLocale_((uint64_t)v6, (uint64_t)TimeZoneWithNSString, Default);
  BOOL v8 = v6;
  [(JavaUtilCalendar *)v8 setTimeWithJavaUtilDate:a3];
  self->changeYear_ = [(JavaUtilCalendar *)v8 getWithInt:1];
  unsigned int v9 = [(JavaUtilCalendar *)v8 getWithInt:0];
  int changeYear = self->changeYear_;
  if (!v9)
  {
    int changeYear = 1 - changeYear;
    self->changeYear_ = changeYear;
  }
  self->julianSkew_ = changeYear / 100 + changeYear / -400 + (changeYear - 2000) / 400 + (changeYear - 2000) / -100 - 2;
  int v11 = [(JavaUtilCalendar *)v8 getWithInt:6];
  if (v11 >= self->julianSkew_)
  {
    self->lastYearSkew_ = 0;
    int julianSkew = self->julianSkew_;
    uint64_t v13 = &OBJC_IVAR___JavaUtilGregorianCalendar_currentYearSkew_;
  }
  else
  {
    self->currentYearSkew_ = v11 - 1;
    int julianSkew = self->julianSkew_ - v11 + 1;
    uint64_t v13 = &OBJC_IVAR___JavaUtilGregorianCalendar_lastYearSkew_;
  }
  *(_DWORD *)((char *)&self->super.super.isa + *v13) = julianSkew;
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultWriteObject];
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultReadObject];
  uint64_t v4 = new_JavaUtilDate_initWithLong_(self->gregorianCutover_);
  [(JavaUtilGregorianCalendar *)self setGregorianChangeWithJavaUtilDate:v4];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v9 = 0x1F1F1E1F1E1F1C1FLL;
    int v10 = 522067742;
    JreStrongAssignAndConsume((id *)&JavaUtilGregorianCalendar_DaysInMonth_, +[IOSByteArray newArrayWithBytes:&v9 count:12]);
    v8[0] = xmmword_10031FDD8;
    v8[1] = unk_10031FDE8;
    v8[2] = xmmword_10031FDF8;
    JreStrongAssignAndConsume((id *)&qword_100560A90, +[IOSIntArray newArrayWithInts:v8 count:12]);
    int v7 = 7200000;
    v6[0] = xmmword_10031FE08;
    v6[1] = unk_10031FE18;
    v6[2] = xmmword_10031FE28;
    v6[3] = unk_10031FE38;
    JreStrongAssignAndConsume((id *)&qword_100560A78, +[IOSIntArray newArrayWithInts:v6 count:17]);
    int v5 = 0;
    v4[0] = xmmword_10031FE4C;
    v4[1] = *(_OWORD *)algn_10031FE5C;
    v4[2] = xmmword_10031FE6C;
    v4[3] = unk_10031FE7C;
    JreStrongAssignAndConsume((id *)&qword_100560A88, +[IOSIntArray newArrayWithInts:v4 count:17]);
    int v3 = 1200000;
    v2[0] = xmmword_10031FE90;
    v2[1] = unk_10031FEA0;
    v2[2] = xmmword_10031FEB0;
    v2[3] = unk_10031FEC0;
    JreStrongAssignAndConsume((id *)&qword_100560A80, +[IOSIntArray newArrayWithInts:v2 count:17]);
    atomic_store(1u, JavaUtilGregorianCalendar__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100416A30;
}

@end