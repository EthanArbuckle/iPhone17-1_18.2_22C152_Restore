@interface GCDevicePhysicalInputDirectionPadElementDescription(Client)
+ (uint64_t)parametersClass;
- (id)makeParameters;
@end

@implementation GCDevicePhysicalInputDirectionPadElementDescription(Client)

+ (uint64_t)parametersClass
{
  return objc_opt_class();
}

- (id)makeParameters
{
  v27.receiver = a1;
  v27.super_class = (Class)&off_26D2AB548;
  id v3 = objc_msgSendSuper2(&v27, sel_makeParameters);
  v5 = [a1 xySources];
  if (v5)
  {
    v1 = [a1 xySources];
    v6 = +[NSSet setWithArray:v1];
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v6 = 0;
  if (v3) {
LABEL_3:
  }
    objc_setProperty_nonatomic_copy(v3, v4, v6, 48);
LABEL_4:
  if (v5)
  {
  }
  v8 = [a1 xSources];
  if (v8)
  {
    v1 = [a1 xSources];
    v9 = +[NSSet setWithArray:v1];
    if (!v3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v9 = 0;
  if (v3) {
LABEL_8:
  }
    objc_setProperty_nonatomic_copy(v3, v7, v9, 56);
LABEL_9:
  if (v8)
  {
  }
  v11 = [a1 ySources];
  if (v11)
  {
    v1 = [a1 ySources];
    v12 = +[NSSet setWithArray:v1];
    if (!v3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v12 = 0;
  if (v3) {
LABEL_13:
  }
    objc_setProperty_nonatomic_copy(v3, v10, v12, 64);
LABEL_14:
  if (v11)
  {
  }
  v14 = [a1 upSources];
  if (v14)
  {
    v1 = [a1 upSources];
    v15 = +[NSSet setWithArray:v1];
    if (!v3) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v15 = 0;
  if (v3) {
LABEL_18:
  }
    objc_setProperty_nonatomic_copy(v3, v13, v15, 72);
LABEL_19:
  if (v14)
  {
  }
  v17 = [a1 rightSources];
  if (v17)
  {
    v1 = [a1 rightSources];
    v18 = +[NSSet setWithArray:v1];
    if (!v3) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  v18 = 0;
  if (v3) {
LABEL_23:
  }
    objc_setProperty_nonatomic_copy(v3, v16, v18, 96);
LABEL_24:
  if (v17)
  {
  }
  v20 = [a1 downSources];
  if (v20)
  {
    v1 = [a1 downSources];
    v21 = +[NSSet setWithArray:v1];
    if (!v3) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  v21 = 0;
  if (v3) {
LABEL_28:
  }
    objc_setProperty_nonatomic_copy(v3, v19, v21, 88);
LABEL_29:
  if (v20)
  {
  }
  v23 = [a1 leftSources];
  if (v23)
  {
    v1 = [a1 leftSources];
    v24 = +[NSSet setWithArray:v1];
    if (!v3) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  v24 = 0;
  if (v3) {
LABEL_33:
  }
    objc_setProperty_nonatomic_copy(v3, v22, v24, 80);
LABEL_34:
  if (v23)
  {
  }
  char v25 = [a1 isAnalog];
  if (v3)
  {
    *((unsigned char *)v3 + 40) = v25;
    *((void *)v3 + 13) = [a1 eventUpValueField];
    *((void *)v3 + 16) = [a1 eventRightValueField];
    *((void *)v3 + 14) = [a1 eventDownValueField];
    *((void *)v3 + 15) = [a1 eventLeftValueField];
  }
  else
  {
    [a1 eventUpValueField];
    [a1 eventRightValueField];
    [a1 eventDownValueField];
    [a1 eventLeftValueField];
  }
  return v3;
}

@end