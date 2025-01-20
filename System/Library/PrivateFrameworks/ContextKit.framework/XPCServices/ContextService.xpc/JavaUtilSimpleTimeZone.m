@interface JavaUtilSimpleTimeZone
+ (const)__metadata;
- (BOOL)hasSameRulesWithJavaUtilTimeZone:(id)a3;
- (BOOL)inDaylightTimeWithJavaUtilDate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLeapYearWithInt:(int)a3;
- (BOOL)useDaylightTime;
- (JavaUtilSimpleTimeZone)initWithInt:(int)a3 withNSString:(id)a4;
- (JavaUtilSimpleTimeZone)initWithInt:(int)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8 withInt:(int)a9 withInt:(int)a10 withInt:(int)a11 withInt:(int)a12;
- (JavaUtilSimpleTimeZone)initWithInt:(int)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8 withInt:(int)a9 withInt:(int)a10 withInt:(int)a11 withInt:(int)a12 withInt:(int)a13;
- (JavaUtilSimpleTimeZone)initWithInt:(int)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8 withInt:(int)a9 withInt:(int)a10 withInt:(int)a11 withInt:(int)a12 withInt:(int)a13 withInt:(int)a14 withInt:(int)a15;
- (id)clone;
- (id)description;
- (int)getDSTSavings;
- (int)getOffsetWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8;
- (int)getOffsetWithLong:(int64_t)a3;
- (int)getRawOffset;
- (int)mod7WithInt:(int)a3;
- (unint64_t)hash;
- (void)checkDayWithInt:(int)a3 withInt:(int)a4;
- (void)checkRangeWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)setDSTSavingsWithInt:(int)a3;
- (void)setEndRuleWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)setEndRuleWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (void)setEndRuleWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
- (void)setRawOffsetWithInt:(int)a3;
- (void)setStartRuleWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)setStartRuleWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (void)setStartRuleWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
- (void)setStartYearWithInt:(int)a3;
@end

@implementation JavaUtilSimpleTimeZone

- (JavaUtilSimpleTimeZone)initWithInt:(int)a3 withNSString:(id)a4
{
  self->dstSavings_ = 3600000;
  [(JavaUtilTimeZone *)self setIDWithNSString:a4];
  self->rawOffset_ = a3;
  return self;
}

- (JavaUtilSimpleTimeZone)initWithInt:(int)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8 withInt:(int)a9 withInt:(int)a10 withInt:(int)a11 withInt:(int)a12
{
  return self;
}

- (JavaUtilSimpleTimeZone)initWithInt:(int)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8 withInt:(int)a9 withInt:(int)a10 withInt:(int)a11 withInt:(int)a12 withInt:(int)a13
{
  return self;
}

- (JavaUtilSimpleTimeZone)initWithInt:(int)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8 withInt:(int)a9 withInt:(int)a10 withInt:(int)a11 withInt:(int)a12 withInt:(int)a13 withInt:(int)a14 withInt:(int)a15
{
  self->startMode_ = a9;
  self->endMode_ = a14;
  return self;
}

- (id)clone
{
  v4.receiver = self;
  v4.super_class = (Class)JavaUtilSimpleTimeZone;
  id v2 = [(JavaUtilTimeZone *)&v4 clone];
  objc_opt_class();
  if (v2 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_21;
  }
  objc_opt_class();
  if (!a3)
  {
    [(JavaUtilTimeZone *)self getID];
    goto LABEL_26;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  id v5 = [(JavaUtilTimeZone *)self getID];
  if (!v5) {
LABEL_26:
  }
    JreThrowNullPointerException();
  unsigned int v6 = objc_msgSend(v5, "isEqual:", objc_msgSend(a3, "getID"));
  if (!v6) {
    return v6;
  }
  if (self->rawOffset_ != *((_DWORD *)a3 + 6) || self->useDaylight_ != *((unsigned __int8 *)a3 + 72)) {
    goto LABEL_21;
  }
  if (!self->useDaylight_)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  if (self->startYear_ != *((_DWORD *)a3 + 7)
    || self->startMonth_ != *((_DWORD *)a3 + 8)
    || self->startDay_ != *((_DWORD *)a3 + 9)
    || self->startMode_ != *((_DWORD *)a3 + 16)
    || self->startDayOfWeek_ != *((_DWORD *)a3 + 10)
    || self->startTime_ != *((_DWORD *)a3 + 11)
    || self->endMonth_ != *((_DWORD *)a3 + 12)
    || self->endDay_ != *((_DWORD *)a3 + 13)
    || self->endDayOfWeek_ != *((_DWORD *)a3 + 14)
    || self->endTime_ != *((_DWORD *)a3 + 15)
    || self->endMode_ != *((_DWORD *)a3 + 17))
  {
LABEL_21:
    LOBYTE(v6) = 0;
    return v6;
  }
  LOBYTE(v6) = self->dstSavings_ == *((_DWORD *)a3 + 19);
  return v6;
}

- (int)getDSTSavings
{
  if (self->useDaylight_) {
    return self->dstSavings_;
  }
  else {
    return 0;
  }
}

- (int)getOffsetWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8
{
  if (a3 >= 2)
  {
    CFStringRef v79 = JreStrcat("$I", (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, *(uint64_t *)&a7, *(uint64_t *)&a8, @"Invalid era: ");
    v80 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v79);
    objc_exception_throw(v80);
  }
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = *(void *)&a5;
  sub_10024FC7C(*(uint64_t *)&a5, *(uint64_t *)&a7, *(uint64_t *)&a8, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, *(uint64_t *)&a7, *(uint64_t *)&a8);
  if (v12 != 1 || v11 != 29) {
    goto LABEL_10;
  }
  unsigned int v21 = a4 & 3;
  if (a4 < 1583 || (a4 & 3) != 0)
  {
    if (a4 > 1582)
    {
LABEL_10:
      sub_10024FD04(v12, v11, v15, v16, v17, v18, v19, v20);
      goto LABEL_11;
    }
  }
  else
  {
    HIDWORD(v22) = -1030792151 * a4;
    LODWORD(v22) = -1030792151 * a4;
    if ((v22 >> 2) > 0x28F5C28) {
      goto LABEL_11;
    }
    unsigned int v21 = a4 % 0x190u;
  }
  if (v21) {
    goto LABEL_10;
  }
LABEL_11:
  unsigned int v23 = [(JavaUtilSimpleTimeZone *)self useDaylightTime];
  if (a3 != 1 || !v23 || self->startYear_ > a4) {
    return self->rawOffset_;
  }
  int endMonth = self->endMonth_;
  int startMonth = self->startMonth_;
  if (endMonth >= startMonth)
  {
    if (endMonth >= (int)v12)
    {
      BOOL v26 = __OFSUB__(startMonth, v12);
      BOOL v28 = startMonth <= (int)v12;
    }
    else
    {
      BOOL v26 = 0;
      BOOL v28 = 0;
    }
    if (!v28) {
      return self->rawOffset_;
    }
  }
  else
  {
    if (endMonth < (int)v12)
    {
      BOOL v26 = __OFSUB__(startMonth, v12);
      BOOL v27 = startMonth <= (int)v12;
    }
    else
    {
      BOOL v26 = 0;
      BOOL v27 = 1;
    }
    if (!v27) {
      return self->rawOffset_;
    }
  }
  int v29 = (a7 - (int)v11) % 7;
  if ((v29 & (a7 - (int)v11)) < 0 != v26) {
    int v30 = v29 + 7;
  }
  else {
    int v30 = (a7 - (int)v11) % 7;
  }
  BOOL v31 = __OFSUB__(startMonth, v12);
  if (startMonth == v12)
  {
    switch(self->startMode_)
    {
      case 1:
        int startDay = self->startDay_;
        goto LABEL_129;
      case 2:
        int v46 = self->startDay_;
        if ((v46 & 0x80000000) == 0)
        {
          int v47 = self->startDayOfWeek_ - v30;
          if (((v47 % 7) & v47) < 0 != v31) {
            int v48 = v47 % 7 + 7;
          }
          else {
            int v48 = v47 % 7;
          }
          int startDay = v48 - v46 + 8 * v46 - 6;
          goto LABEL_129;
        }
        if ((atomic_load_explicit((atomic_uchar *volatile)JavaUtilGregorianCalendar__initialized, memory_order_acquire) & 1) == 0) {
          objc_opt_class();
        }
        if (!JavaUtilGregorianCalendar_DaysInMonth_) {
LABEL_133:
        }
          JreThrowNullPointerException();
        uint64_t v61 = self->startMonth_;
        uint64_t v62 = *(unsigned int *)(JavaUtilGregorianCalendar_DaysInMonth_ + 8);
        if ((v61 & 0x80000000) != 0 || (int)v61 >= (int)v62) {
          IOSArray_throwOutOfBoundsWithMsg(v62, v61);
        }
        int v63 = *(char *)(JavaUtilGregorianCalendar_DaysInMonth_ + 12 + (int)v61);
        BOOL v64 = __OFSUB__(v61, 1);
        if (v61 != 1) {
          goto LABEL_125;
        }
        unsigned int v65 = a4 & 3;
        if (a4 < 1583 || (a4 & 3) != 0)
        {
          BOOL v64 = __OFSUB__(a4, 1582);
          if (a4 > 1582) {
            goto LABEL_125;
          }
        }
        else
        {
          HIDWORD(v67) = -1030792151 * a4;
          LODWORD(v67) = -1030792151 * a4;
          unsigned int v66 = v67 >> 2;
          BOOL v64 = __OFSUB__(v66, 42949672);
          if (v66 > 0x28F5C28) {
            goto LABEL_124;
          }
          unsigned int v65 = a4 % 0x190u;
        }
        if (v65) {
          goto LABEL_125;
        }
LABEL_124:
        ++v63;
LABEL_125:
        int v76 = v63 - self->startDay_ + 8 * self->startDay_;
        int v77 = self->startDayOfWeek_ - v63 - v30;
        if (((v77 % 7) & v77) < 0 != v64) {
          int v78 = v77 % 7 + 7;
        }
        else {
          int v78 = v77 % 7;
        }
        int startDay = v76 + v78 + 1;
LABEL_129:
        if (startDay > (int)v11) {
          return self->rawOffset_;
        }
        if (startDay == v11)
        {
          int startDay = v11;
          if (self->startTime_ > a8) {
            return self->rawOffset_;
          }
        }
        break;
      case 3:
        int v49 = self->startDay_;
        int v50 = self->startDayOfWeek_ - v49 - v30 + 1;
        if (((v50 % 7) & v50) < 0 != v31) {
          int v51 = v50 % 7 + 7;
        }
        else {
          int v51 = v50 % 7;
        }
        int startDay = v51 + v49;
        goto LABEL_129;
      case 4:
        int v52 = self->startDay_;
        int v53 = self->startDayOfWeek_ - v52 - v30 + 1;
        if (((v53 % 7) & v53) < 0 != v31) {
          int v54 = v53 % 7 + 7;
        }
        else {
          int v54 = v53 % 7;
        }
        int startDay = v52 + v54 - 7;
        if (!v54) {
          int startDay = self->startDay_;
        }
        goto LABEL_129;
      default:
        int startDay = 0;
        goto LABEL_129;
    }
  }
  else
  {
    int startDay = 0;
  }
  int v33 = self->endTime_ - self->dstSavings_;
  int v34 = ((int)v12 + 1) % 12;
  LODWORD(v35) = self->endMonth_;
  BOOL v36 = __OFSUB__(v35, v12);
  if (v35 != v12)
  {
    if ((v33 & 0x80000000) == 0) {
      return self->dstSavings_ + self->rawOffset_;
    }
    BOOL v36 = __OFSUB__(v34, v35);
    if (v34 != v35) {
      return self->dstSavings_ + self->rawOffset_;
    }
  }
  switch(self->endMode_)
  {
    case 1:
      int startDay = self->endDay_;
      goto LABEL_95;
    case 2:
      int endDay = self->endDay_;
      if ((endDay & 0x80000000) == 0)
      {
        int v38 = self->endDayOfWeek_ - v30;
        if (((v38 % 7) & v38) < 0 != v36) {
          int v39 = v38 % 7 + 7;
        }
        else {
          int v39 = v38 % 7;
        }
        int startDay = v39 - endDay + 8 * endDay - 6;
        goto LABEL_95;
      }
      if ((atomic_load_explicit((atomic_uchar *volatile)JavaUtilGregorianCalendar__initialized, memory_order_acquire) & 1) == 0)
      {
        int v84 = v33;
        objc_opt_class();
        int v34 = ((int)v12 + 1) % 12;
        int v33 = v84;
      }
      if (!JavaUtilGregorianCalendar_DaysInMonth_) {
        goto LABEL_133;
      }
      uint64_t v35 = self->endMonth_;
      uint64_t v55 = *(unsigned int *)(JavaUtilGregorianCalendar_DaysInMonth_ + 8);
      if ((v35 & 0x80000000) != 0 || (int)v35 >= (int)v55) {
        IOSArray_throwOutOfBoundsWithMsg(v55, v35);
      }
      int v56 = *(char *)(JavaUtilGregorianCalendar_DaysInMonth_ + 12 + (int)v35);
      BOOL v57 = __OFSUB__(v35, 1);
      if (v35 != 1) {
        goto LABEL_91;
      }
      unsigned int v58 = a4 & 3;
      if (a4 < 1583 || (a4 & 3) != 0)
      {
        BOOL v57 = __OFSUB__(a4, 1582);
        if (a4 > 1582) {
          goto LABEL_91;
        }
      }
      else
      {
        HIDWORD(v60) = -1030792151 * a4;
        LODWORD(v60) = -1030792151 * a4;
        unsigned int v59 = v60 >> 2;
        BOOL v57 = __OFSUB__(v59, 42949672);
        if (v59 > 0x28F5C28) {
          goto LABEL_90;
        }
        unsigned int v58 = a4 % 0x190u;
      }
      if (v58) {
        goto LABEL_91;
      }
LABEL_90:
      ++v56;
LABEL_91:
      int v68 = v56 - self->endDay_ + 8 * self->endDay_;
      int v69 = self->endDayOfWeek_ - v56 - v30;
      if (((v69 % 7) & v69) < 0 != v57) {
        int v70 = v69 % 7 + 7;
      }
      else {
        int v70 = v69 % 7;
      }
      int startDay = v68 + v70 + 1;
LABEL_95:
      if ((v33 & 0x80000000) == 0) {
        goto LABEL_115;
      }
      unsigned int v71 = -v33 / 0x5265C00u;
      v33 += 86400000 * v71 + 86400000;
      startDay += ~v71;
      if (startDay > 0) {
        goto LABEL_115;
      }
      if ((int)v35 - 1 >= 0) {
        uint64_t v72 = (v35 - 1);
      }
      else {
        uint64_t v72 = 11;
      }
      if ((atomic_load_explicit((atomic_uchar *volatile)JavaUtilGregorianCalendar__initialized, memory_order_acquire) & 1) == 0)
      {
        int v83 = v33;
        int v82 = v34;
        int v81 = startDay;
        objc_opt_class();
        int startDay = v81;
        int v34 = v82;
        int v33 = v83;
      }
      if (!JavaUtilGregorianCalendar_DaysInMonth_) {
        goto LABEL_133;
      }
      uint64_t v73 = *(unsigned int *)(JavaUtilGregorianCalendar_DaysInMonth_ + 8);
      if ((int)v72 >= (int)v73) {
        IOSArray_throwOutOfBoundsWithMsg(v73, v72);
      }
      startDay += *(char *)(JavaUtilGregorianCalendar_DaysInMonth_ + 12 + (int)v72);
      if (v72 != 1)
      {
        LODWORD(v35) = v72;
        goto LABEL_115;
      }
      if (a4 >= 1583 && (a4 & 3) == 0)
      {
        HIDWORD(v74) = -1030792151 * a4;
        LODWORD(v74) = -1030792151 * a4;
        if ((v74 >> 2) <= 0x28F5C28 && a4 % 0x190u) {
          goto LABEL_114;
        }
        goto LABEL_113;
      }
      LODWORD(v35) = 1;
      if (a4 <= 1582 && (a4 & 3) == 0)
      {
LABEL_113:
        ++startDay;
LABEL_114:
        LODWORD(v35) = 1;
      }
LABEL_115:
      if (v35 == v12)
      {
        if (startDay >= (int)v11 && (startDay != v11 || v33 > a8)) {
          return self->dstSavings_ + self->rawOffset_;
        }
      }
      else if (v34 == v35)
      {
        return self->dstSavings_ + self->rawOffset_;
      }
      return self->rawOffset_;
    case 3:
      int v40 = self->endDay_;
      int v41 = self->endDayOfWeek_ - v40 - v30 + 1;
      if (((v41 % 7) & v41) < 0 != v36) {
        int v42 = v41 % 7 + 7;
      }
      else {
        int v42 = v41 % 7;
      }
      int startDay = v42 + v40;
      goto LABEL_95;
    case 4:
      int v43 = self->endDay_;
      int v44 = self->endDayOfWeek_ - v43 - v30 + 1;
      if (((v44 % 7) & v44) < 0 != v36) {
        int v45 = v44 % 7 + 7;
      }
      else {
        int v45 = v44 % 7;
      }
      if (v45) {
        int startDay = v43 + v45 - 7;
      }
      else {
        int startDay = self->endDay_;
      }
      goto LABEL_95;
    default:
      goto LABEL_95;
  }
}

- (int)getOffsetWithLong:(int64_t)a3
{
  unsigned int v5 = [(JavaUtilSimpleTimeZone *)self useDaylightTime];
  uint64_t rawOffset = self->rawOffset_;
  if (v5)
  {
    v7 = JavaUtilGrego_timeToFieldsWithLong_withIntArray_(rawOffset + a3, 0);
    if (!v7) {
      JreThrowNullPointerException();
    }
    v8 = (unsigned int *)v7;
    uint64_t size = v7->super.size_;
    if ((int)size < 1) {
      IOSArray_throwOutOfBoundsWithMsg(size, 0);
    }
    if ((int)size < 2) {
      IOSArray_throwOutOfBoundsWithMsg(size, 1);
    }
    if ((int)size < 3) {
      IOSArray_throwOutOfBoundsWithMsg(size, 2);
    }
    uint64_t v11 = v8[5];
    if ((int)size <= 3) {
      IOSArray_throwOutOfBoundsWithMsg(size, 3);
    }
    uint64_t v12 = v8[6];
    if ((int)size <= 5) {
      IOSArray_throwOutOfBoundsWithMsg(size, 5);
    }
    uint64_t v13 = v8[8];
    uint64_t v14 = v8[3];
    uint64_t v10 = v8[4];
    LODWORD(rawOffset) = [(JavaUtilSimpleTimeZone *)self getOffsetWithInt:1 withInt:v14 withInt:v10 withInt:v11 withInt:v12 withInt:v13];
  }
  return rawOffset;
}

- (int)getRawOffset
{
  return self->rawOffset_;
}

- (unint64_t)hash
{
  objc_sync_enter(self);
  id v3 = [(JavaUtilTimeZone *)self getID];
  if (!v3) {
    JreThrowNullPointerException();
  }
  signed int v4 = self->rawOffset_ + [v3 hash];
  if (self->useDaylight_) {
    v4 += self->startYear_
  }
        + self->startMonth_
        + self->startDay_
        + self->startDayOfWeek_
        + self->startTime_
        + self->startMode_
        + self->endMonth_
        + self->endDay_
        + self->endDayOfWeek_
        + self->endTime_
        + self->endMode_
        + self->dstSavings_;
  unint64_t v5 = v4;
  objc_sync_exit(self);
  return v5;
}

- (BOOL)hasSameRulesWithJavaUtilTimeZone:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if (self->useDaylight_ != *((unsigned __int8 *)a3 + 72)) {
    return 0;
  }
  int rawOffset = self->rawOffset_;
  int v6 = *((_DWORD *)a3 + 6);
  BOOL result = !self->useDaylight_ && rawOffset == v6;
  if (self->useDaylight_ && rawOffset == v6)
  {
    if (self->dstSavings_ == *((_DWORD *)a3 + 19)
      && self->startYear_ == *((_DWORD *)a3 + 7)
      && self->startMonth_ == *((_DWORD *)a3 + 8)
      && self->startDay_ == *((_DWORD *)a3 + 9)
      && self->startMode_ == *((_DWORD *)a3 + 16)
      && self->startDayOfWeek_ == *((_DWORD *)a3 + 10)
      && self->startTime_ == *((_DWORD *)a3 + 11)
      && self->endMonth_ == *((_DWORD *)a3 + 12)
      && self->endDay_ == *((_DWORD *)a3 + 13)
      && self->endDayOfWeek_ == *((_DWORD *)a3 + 14)
      && self->endTime_ == *((_DWORD *)a3 + 15))
    {
      return self->endMode_ == *((_DWORD *)a3 + 17);
    }
    return 0;
  }
  return result;
}

- (BOOL)inDaylightTimeWithJavaUtilDate:(id)a3
{
  BOOL v5 = [(JavaUtilSimpleTimeZone *)self useDaylightTime];
  if (v5)
  {
    if (!a3) {
      JreThrowNullPointerException();
    }
    unsigned int v6 = -[JavaUtilSimpleTimeZone getOffsetWithLong:](self, "getOffsetWithLong:", [a3 getTime]);
    LOBYTE(v5) = v6 != [(JavaUtilSimpleTimeZone *)self getRawOffset];
  }
  return v5;
}

- (BOOL)isLeapYearWithInt:(int)a3
{
  BOOL result = (a3 & 3) == 0 && a3 < 1583;
  if (a3 >= 1583)
  {
    HIDWORD(v5) = -1030792151 * a3;
    LODWORD(v5) = -1030792151 * a3;
    unsigned int v4 = v5 >> 2;
    HIDWORD(v5) = -1030792151 * a3;
    LODWORD(v5) = -1030792151 * a3;
    BOOL v6 = (v5 >> 4) < 0xA3D70B;
    BOOL v7 = v4 > 0x28F5C28 || v6;
    if ((a3 & 3) == 0) {
      return v7;
    }
  }
  return result;
}

- (int)mod7WithInt:(int)a3
{
  if (((a3 % 7) & a3) < 0 != v3) {
    return a3 % 7 + 7;
  }
  else {
    return a3 % 7;
  }
}

- (void)setDSTSavingsWithInt:(int)a3
{
  if (a3 < 1)
  {
    char v3 = new_JavaLangIllegalArgumentException_init();
    objc_exception_throw(v3);
  }
  self->dstSavings_ = a3;
}

- (void)checkRangeWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  sub_10024FC7C(*(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7);
}

- (void)checkDayWithInt:(int)a3 withInt:(int)a4
{
  sub_10024FD04(*(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

- (void)setEndRuleWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  self->endMonth_ = a3;
  self->endDay_ = a4;
  self->endDayOfWeek_ = 0;
  self->endTime_ = a5;
  sub_1002503C4((uint64_t)self, (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7);
}

- (void)setEndRuleWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  self->endMonth_ = a3;
  self->endDay_ = a4;
  self->endDayOfWeek_ = a5;
  self->endTime_ = a6;
  sub_1002503C4((uint64_t)self, (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, v6, v7);
}

- (void)setEndRuleWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
  self->endMonth_ = a3;
  if (a7) {
    int v8 = a4;
  }
  else {
    int v8 = -a4;
  }
  self->endDay_ = v8;
  self->endDayOfWeek_ = -a5;
  self->endTime_ = a6;
  sub_1002503C4((uint64_t)self, (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, a7, v7);
}

- (void)setRawOffsetWithInt:(int)a3
{
  self->rawOffset_ = a3;
}

- (void)setStartRuleWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  self->startMonth_ = a3;
  self->startDay_ = a4;
  self->startDayOfWeek_ = 0;
  self->startTime_ = a5;
  sub_10025060C((uint64_t)self, (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7);
}

- (void)setStartRuleWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  self->startMonth_ = a3;
  self->startDay_ = a4;
  self->startDayOfWeek_ = a5;
  self->startTime_ = a6;
  sub_10025060C((uint64_t)self, (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, v6, v7);
}

- (void)setStartRuleWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
  self->startMonth_ = a3;
  if (a7) {
    int v8 = a4;
  }
  else {
    int v8 = -a4;
  }
  self->startDay_ = v8;
  self->startDayOfWeek_ = -a5;
  self->startTime_ = a6;
  sub_10025060C((uint64_t)self, (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, a7, v7);
}

- (void)setStartYearWithInt:(int)a3
{
  self->startYear_ = a3;
  self->useDaylight_ = 1;
}

- (id)description
{
  id v3 = objc_msgSend(-[JavaUtilSimpleTimeZone getClass](self, "getClass"), "getName");
  [(JavaUtilTimeZone *)self getID];
  return (id)JreStrcat("$$$$I$I$Z$I$I$I$I$I$I$I$I$I$I$IC", @",startTime=", self->endMonth_, self->endDay_, @",endDay=", 93, v4, v5, v3);
}

- (BOOL)useDaylightTime
{
  return self->useDaylight_;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100465790;
}

@end