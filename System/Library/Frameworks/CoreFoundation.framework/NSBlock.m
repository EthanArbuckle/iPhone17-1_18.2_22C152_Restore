@interface NSBlock
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)invoke;
- (void)performAfterDelay:(double)a3;
@end

@implementation NSBlock

- (void)invoke
{
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

+ (id)alloc
{
  return 0;
}

- (void)performAfterDelay:(double)a3
{
  double v4 = a3 * 1000.0 * 1000.0 * 1000.0;
  if ((unint64_t)v4 <= 2) {
    int64_t v5 = 2;
  }
  else {
    int64_t v5 = (unint64_t)v4;
  }
  dispatch_time_t v6 = dispatch_time(0, v5);
  qos_class_t v7 = qos_class_self();
  global_queue = dispatch_get_global_queue(v7, 0);

  dispatch_after(v6, global_queue, self);
}

- (id)debugDescription
{
  uint64_t v19 = *(void *)off_1ECE0A5B0;
  if (((uint64_t)self[1].super.isa & 0x2000000) != 0) {
    v3 = (char *)self[3].super.isa + 16;
  }
  else {
    v3 = 0;
  }
  double v4 = _Block_signature(self);
  if (!self[2].super.isa)
  {
    Class isa = 0;
    if (v3) {
      goto LABEL_6;
    }
LABEL_9:
    dispatch_time_t v6 = 0;
    goto LABEL_14;
  }
  Class isa = self[2].super.isa;
  if (!v3) {
    goto LABEL_9;
  }
LABEL_6:
  if (*(void *)v3) {
    dispatch_time_t v6 = *(const void **)v3;
  }
  else {
    dispatch_time_t v6 = 0;
  }
  if (*((void *)v3 + 1)) {
    v3 = (char *)*((void *)v3 + 1);
  }
  else {
    v3 = 0;
  }
LABEL_14:
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  v8 = (objc_class *)objc_opt_class();
  Name = class_getName(v8);
  v10 = "<unknown signature>";
  if (v4) {
    v10 = v4;
  }
  CFStringAppendFormat(Mutable, 0, @"<%s: %p>\n signature: \"%s\"", Name, self, v10);
  memset(&v18, 0, sizeof(v18));
  if (isa && dladdr(isa, &v18))
  {
    dli_fname = "<unknown invoke library>";
    if (v18.dli_fname) {
      dli_fname = v18.dli_fname;
    }
    dli_sname = "<unknown invoke symbol>";
    if (v18.dli_sname) {
      dli_sname = v18.dli_sname;
    }
  }
  if (v6 && dladdr(v6, &v18))
  {
    v13 = "<unknown copy library>";
    if (v18.dli_fname) {
      v13 = v18.dli_fname;
    }
    v14 = "<unknown copy symbol>";
    if (v18.dli_sname) {
      v14 = v18.dli_sname;
    }
  }
  if (v3 && dladdr(v3, &v18))
  {
    v15 = "<unknown dispose library>";
    if (v18.dli_fname) {
      v15 = v18.dli_fname;
    }
    v16 = "<unknown dispose symbol>";
    if (v18.dli_sname) {
      v16 = v18.dli_sname;
    }
  }
  return Mutable;
}

@end