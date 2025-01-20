@interface FMXPCActivityCriteria
+ (unint64_t)_optionsFromXPCObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)repeating;
- (FMXPCActivityCriteria)initWithPriority:(int64_t)a3 repeating:(BOOL)a4 delay:(int64_t)a5 gracePeriod:(int64_t)a6 interval:(int64_t)a7 options:(unint64_t)a8;
- (FMXPCActivityCriteria)initWithXPCObject:(id)a3;
- (id)description;
- (id)xpcDictionary;
- (int64_t)_priorityFromString:(const char *)a3;
- (int64_t)delay;
- (int64_t)gracePeriod;
- (int64_t)interval;
- (int64_t)priority;
- (unint64_t)options;
- (void)setDelay:(int64_t)a3;
- (void)setGracePeriod:(int64_t)a3;
- (void)setInterval:(int64_t)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPriority:(int64_t)a3;
- (void)setRepeating:(BOOL)a3;
@end

@implementation FMXPCActivityCriteria

- (FMXPCActivityCriteria)initWithPriority:(int64_t)a3 repeating:(BOOL)a4 delay:(int64_t)a5 gracePeriod:(int64_t)a6 interval:(int64_t)a7 options:(unint64_t)a8
{
  v15.receiver = self;
  v15.super_class = (Class)FMXPCActivityCriteria;
  result = [(FMXPCActivityCriteria *)&v15 init];
  if (result)
  {
    result->_repeating = a4;
    result->_priority = a3;
    result->_delay = a5;
    result->_gracePeriod = a6;
    result->_interval = a7;
    result->_options = a8;
  }
  return result;
}

- (FMXPCActivityCriteria)initWithXPCObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMXPCActivityCriteria;
  v5 = [(FMXPCActivityCriteria *)&v8 init];
  if (v5)
  {
    string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F142C8]);
    if (string)
    {
      v5->_priority = [(FMXPCActivityCriteria *)v5 _priorityFromString:string];
      v5->_repeating = xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E4F142F8]);
      v5->_delay = xpc_dictionary_get_int64(v4, (const char *)*MEMORY[0x1E4F14170]);
      v5->_gracePeriod = xpc_dictionary_get_int64(v4, (const char *)*MEMORY[0x1E4F141A8]);
      v5->_interval = xpc_dictionary_get_int64(v4, (const char *)*MEMORY[0x1E4F141C8]);
      v5->_options = [(id)objc_opt_class() _optionsFromXPCObject:v4];
    }
    else
    {

      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(FMXPCActivityCriteria *)self priority];
    if (v6 == [v5 priority]
      && (int v7 = -[FMXPCActivityCriteria repeating](self, "repeating"), v7 == [v5 repeating])
      && (int64_t v8 = -[FMXPCActivityCriteria delay](self, "delay"), v8 == [v5 delay])
      && (int64_t v9 = -[FMXPCActivityCriteria gracePeriod](self, "gracePeriod"), v9 == [v5 gracePeriod])
      && (int64_t v10 = -[FMXPCActivityCriteria interval](self, "interval"), v10 == [v5 interval]))
    {
      unint64_t v11 = [(FMXPCActivityCriteria *)self options];
      BOOL v12 = v11 == [v5 options];
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[priority: %ld repeating: %d delay: %llu grace: %llu interval: %llu, options: 0x%lx]", -[FMXPCActivityCriteria priority](self, "priority"), -[FMXPCActivityCriteria repeating](self, "repeating"), -[FMXPCActivityCriteria delay](self, "delay"), -[FMXPCActivityCriteria gracePeriod](self, "gracePeriod"), -[FMXPCActivityCriteria interval](self, "interval"), -[FMXPCActivityCriteria options](self, "options")];
}

- (id)xpcDictionary
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  int64_t v4 = [(FMXPCActivityCriteria *)self priority];
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    id v5 = (const char **)MEMORY[0x1E4F142D0];
  }
  else
  {
    id v5 = (const char **)MEMORY[0x1E4F142E0];
  }
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E4F142C8], *v5);
LABEL_6:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F142F8], [(FMXPCActivityCriteria *)self repeating]);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F14170], [(FMXPCActivityCriteria *)self delay]);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F141A8], [(FMXPCActivityCriteria *)self gracePeriod]);
  if ([(FMXPCActivityCriteria *)self repeating]) {
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F141C8], [(FMXPCActivityCriteria *)self interval]);
  }
  __int16 v6 = [(FMXPCActivityCriteria *)self options];
  __int16 v7 = v6;
  if (v6)
  {
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F142B0], 1);
    if ((v7 & 4) == 0)
    {
LABEL_10:
      if ((v7 & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_28;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_10;
  }
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14348], 1);
  if ((v7 & 2) == 0)
  {
LABEL_11:
    if ((v7 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14358], 1);
  if ((v7 & 8) == 0)
  {
LABEL_12:
    if ((v7 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14370], 1);
  if ((v7 & 0x10) == 0)
  {
LABEL_13:
    if ((v7 & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14310], 1);
  if ((v7 & 0x20) == 0)
  {
LABEL_14:
    if ((v7 & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14318], 1);
  if ((v7 & 0x40) == 0)
  {
LABEL_15:
    if ((v7 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14320], 1);
  if ((v7 & 0x80) == 0)
  {
LABEL_16:
    if ((v7 & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_34;
  }
LABEL_33:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14338], 1);
  if ((v7 & 0x100) == 0)
  {
LABEL_17:
    if ((v7 & 0x2000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_35;
  }
LABEL_34:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14330], 1);
  if ((v7 & 0x2000) == 0)
  {
LABEL_18:
    if ((v7 & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_36;
  }
LABEL_35:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14190], 1);
  if ((v7 & 0x200) == 0)
  {
LABEL_19:
    if ((v7 & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_37;
  }
LABEL_36:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14138], 1);
  if ((v7 & 0x400) == 0)
  {
LABEL_20:
    if ((v7 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_38;
  }
LABEL_37:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14250], 1);
  if ((v7 & 0x800) == 0)
  {
LABEL_21:
    if ((v7 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_38:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14168], 1);
  if ((v7 & 0x1000) != 0) {
LABEL_22:
  }
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14188], 1);
LABEL_23:
  return v3;
}

+ (unint64_t)_optionsFromXPCObject:(id)a3
{
  xpc_object_t v3 = (const char *)*MEMORY[0x1E4F142B0];
  id v4 = a3;
  unint64_t v5 = xpc_dictionary_get_BOOL(v4, v3);
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E4F14348])) {
    v5 |= 4uLL;
  }
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E4F14358])) {
    v5 |= 2uLL;
  }
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E4F14370])) {
    v5 |= 8uLL;
  }
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E4F14310])) {
    v5 |= 0x10uLL;
  }
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E4F14318])) {
    v5 |= 0x20uLL;
  }
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E4F14320])) {
    v5 |= 0x40uLL;
  }
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E4F14338])) {
    v5 |= 0x80uLL;
  }
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E4F14330])) {
    v5 |= 0x100uLL;
  }
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E4F14190])) {
    v5 |= 0x2000uLL;
  }
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E4F14138])) {
    v5 |= 0x200uLL;
  }
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E4F14250])) {
    v5 |= 0x400uLL;
  }
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E4F14168])) {
    v5 |= 0x800uLL;
  }
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E4F14188])) {
    unint64_t v6 = v5 | 0x1000;
  }
  else {
    unint64_t v6 = v5;
  }
  BOOL v7 = xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E4F14160]);

  if (v7) {
    return v6 | 0x4000;
  }
  else {
    return v6;
  }
}

- (int64_t)_priorityFromString:(const char *)a3
{
  size_t v4 = strlen((const char *)*MEMORY[0x1E4F142E0]);
  return strncmp(a3, (const char *)*MEMORY[0x1E4F142E0], v4) != 0;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (BOOL)repeating
{
  return self->_repeating;
}

- (void)setRepeating:(BOOL)a3
{
  self->_repeating = a3;
}

- (int64_t)delay
{
  return self->_delay;
}

- (void)setDelay:(int64_t)a3
{
  self->_delay = a3;
}

- (int64_t)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(int64_t)a3
{
  self->_gracePeriod = a3;
}

- (int64_t)interval
{
  return self->_interval;
}

- (void)setInterval:(int64_t)a3
{
  self->_interval = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

@end