@interface NSValue(CAMLWriter)
- (__CFString)CAMLType;
- (void)encodeWithCAMLWriter:()CAMLWriter;
@end

@implementation NSValue(CAMLWriter)

- (void)encodeWithCAMLWriter:()CAMLWriter
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v5 = (const char *)[a1 objCType];
  v6 = v5;
  if (!v5)
  {
LABEL_9:
    if (strcmp(v6, "{CAColorMatrix=ffffffffffffffffffff}")) {
      return;
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v41 = 0u;
    if (a1) {
      [a1 CAColorMatrixValue];
    }
    CFStringRef v7 = CACreateStringWithFloatArray((uint64_t)&v41, 0x14uLL, 0.000001);
    if (v7) {
      goto LABEL_13;
    }
    goto LABEL_59;
  }
  if (!strcmp(v5, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
  {
    [a1 rectValue];
    *(void *)&long long v41 = v10;
    *((void *)&v41 + 1) = v11;
    *(void *)&long long v42 = v12;
    *((void *)&v42 + 1) = v13;
    unint64_t v14 = 4;
LABEL_18:
    v9 = (__CFString *)CACreateStringWithDoubleArray((uint64_t)&v41, v14, 1.0e-12);
    goto LABEL_19;
  }
  if (!strcmp(v6, "{CGPoint=dd}"))
  {
    [a1 pointValue];
LABEL_17:
    *(void *)&long long v41 = v15;
    *((void *)&v41 + 1) = v16;
    unint64_t v14 = 2;
    goto LABEL_18;
  }
  if (!strcmp(v6, "{CGSize=dd}"))
  {
    [a1 sizeValue];
    goto LABEL_17;
  }
  if (!strcmp(v6, "{CAPoint3D=ddd}"))
  {
    [a1 CAPoint3DValue];
    *(void *)&long long v41 = v17;
    *((void *)&v41 + 1) = v18;
    *(void *)&long long v42 = v19;
    unint64_t v14 = 3;
    goto LABEL_18;
  }
  if (!strcmp(v6, "{CACornerRadii={CGSize=dd}{CGSize=dd}{CGSize=dd}{CGSize=dd}}"))
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    if (a1) {
      [a1 CACornerRadiiValue];
    }
    unint64_t v14 = 8;
    goto LABEL_18;
  }
  if (!strcmp(v6, "{CGAffineTransform=dddddd}"))
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v41 = 0u;
    if (a1) {
      objc_msgSend(a1, "CA_CGAffineTransformValue");
    }
    CFStringRef v7 = CACreateStringWithDoubleArray((uint64_t)&v41, 6uLL, 1.0e-12);
LABEL_13:
    CFStringRef v8 = v7;
    v9 = (__CFString *)CFStringCreateWithFormat(0, 0, @"matrix(%@)", v7);
    CFRelease(v8);
    goto LABEL_19;
  }
  if (strcmp(v6, "{CATransform3D=dddddddddddddddd}")) {
    goto LABEL_9;
  }
  long long v20 = 0uLL;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v21 = 0uLL;
  long long v22 = 0uLL;
  long long v23 = 0uLL;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v24 = 0uLL;
  long long v25 = 0uLL;
  long long v26 = 0uLL;
  long long v27 = 0uLL;
  long long v41 = 0u;
  if (a1)
  {
    [a1 CATransform3DValue];
    long long v27 = v32;
    long long v26 = v33;
    long long v25 = v34;
    long long v24 = v35;
    long long v23 = v36;
    long long v22 = v37;
    long long v21 = v38;
    long long v20 = v39;
  }
  v40[0] = v27;
  v40[1] = v26;
  v40[2] = v25;
  v40[3] = v24;
  v40[4] = v23;
  v40[5] = v22;
  v40[6] = v21;
  v40[7] = v20;
  CA::Mat4Impl::mat4_get_unmatrix((double *)v40, (uint64_t)&v41, 0);
  if (fabs(*((double *)&v45 + 1)) < 1.0e-12
    && fabs(*(double *)&v46) < 1.0e-12
    && fabs(*(double *)&v47 + -1.0) < 1.0e-12)
  {
    Mutable = CFStringCreateMutable(0, 0);
    v9 = Mutable;
    if (*((double *)&v46 + 1) != 0.0) {
      CFStringAppendFormat(Mutable, 0, @"perspective(%g) ", -1.0 / *((double *)&v46 + 1));
    }
    if (fabs(*(double *)&v44) >= 1.0e-12 || fabs(*((double *)&v44 + 1)) >= 1.0e-12 || fabs(*(double *)&v45) >= 1.0e-12) {
      CFStringAppendFormat(v9, 0, @"translate(%g, %g, %g) ", v44, (void)v45);
    }
    if (fabs(*((double *)&v48 + 1)) >= 1.0e-12) {
      CFStringAppendFormat(v9, 0, @"rotate(%gdeg) ", *((double *)&v48 + 1) * 57.2957795);
    }
    if (fabs(*(double *)&v48) >= 1.0e-12) {
      CFStringAppendFormat(v9, 0, @"rotate(%gdeg, 0, 1, 0) ", *(double *)&v48 * 57.2957795);
    }
    if (fabs(*((double *)&v47 + 1)) >= 1.0e-12) {
      CFStringAppendFormat(v9, 0, @"rotate(%gdeg, 1, 0, 0) ", *((double *)&v47 + 1) * 57.2957795);
    }
    if (fabs(*((double *)&v43 + 1)) >= 1.0e-12) {
      CFStringAppendFormat(v9, 0, @"shearYZ(%gdeg) ", *((double *)&v43 + 1) * 57.2957795);
    }
    if (fabs(*(double *)&v43) >= 1.0e-12) {
      CFStringAppendFormat(v9, 0, @"shearXZ(%gdeg) ", *(double *)&v43 * 57.2957795);
    }
    if (fabs(*((double *)&v42 + 1)) >= 1.0e-12) {
      CFStringAppendFormat(v9, 0, @"shearXY(%gdeg) ", *((double *)&v42 + 1) * 57.2957795);
    }
    if (fabs(*(double *)&v41 + -1.0) >= 1.0e-12
      || fabs(*((double *)&v41 + 1) + -1.0) >= 1.0e-12
      || fabs(*(double *)&v42 + -1.0) >= 1.0e-12)
    {
      if (vabdd_f64(*(double *)&v41, *((double *)&v41 + 1)) >= 1.0e-12
        || vabdd_f64(*(double *)&v41, *(double *)&v42) >= 1.0e-12)
      {
        CFStringAppendFormat(v9, 0, @"scale(%g, %g, %g) ", v41, (void)v42);
      }
      else
      {
        CFStringAppendFormat(v9, 0, @"scale(%g) ", (void)v41, v30, v31);
      }
    }
    CFIndex Length = CFStringGetLength(v9);
    if (Length)
    {
      v51.location = Length - 1;
      v51.length = 1;
      CFStringReplace(v9, v51, &stru_1ED039300);
    }
    goto LABEL_19;
  }
  CFStringRef v7 = CACreateStringWithDoubleArray((uint64_t)v40, 0x10uLL, 1.0e-12);
  if (v7) {
    goto LABEL_13;
  }
LABEL_59:
  v9 = 0;
LABEL_19:
  if (v9)
  {
    [a3 setElementContent:v9];
    CFRelease(v9);
  }
}

- (__CFString)CAMLType
{
  v1 = (const char *)[a1 objCType];
  v2 = v1;
  if (!v1) {
    goto LABEL_21;
  }
  if (!strcmp(v1, "{CGRect={CGPoint=dd}{CGSize=dd}}")) {
    return @"CGRect";
  }
  if (!strcmp(v2, "{CGPoint=dd}")) {
    return @"CGPoint";
  }
  if (!strcmp(v2, "{CGSize=dd}")) {
    return @"CGSize";
  }
  if (!strcmp(v2, "{CAPoint3D=ddd}")) {
    return @"CAPoint3D";
  }
  if (!strcmp(v2, "{CACornerRadii={CGSize=dd}{CGSize=dd}{CGSize=dd}{CGSize=dd}}")) {
    return @"CACornerRadii";
  }
  if (!strcmp(v2, "{CGAffineTransform=dddddd}")) {
    return @"CGAffineTransform";
  }
  if (!strcmp(v2, "{CATransform3D=dddddddddddddddd}")) {
    return @"CATransform3D";
  }
LABEL_21:
  if (!strcmp(v2, "{CAColorMatrix=ffffffffffffffffffff}")) {
    return @"CAColorMatrix";
  }
  return @"NSValue";
}

@end