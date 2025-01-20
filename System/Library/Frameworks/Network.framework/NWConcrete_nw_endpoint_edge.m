@interface NWConcrete_nw_endpoint_edge
- (NSString)description;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation NWConcrete_nw_endpoint_edge

- (void).cxx_destruct
{
}

- (id)redactedDescription
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->endpoint);
  logging_description = nw_endpoint_get_logging_description(WeakRetained);
  v5 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"<nw_endpoint_edge %s %s>", &self->identifier, logging_description);

  return v5;
}

- (NSString)description
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  p_identifier = &self->identifier;
  id WeakRetained = objc_loadWeakRetained((id *)&self->endpoint);
  v5 = (__CFString *)CFStringCreateWithFormat(v2, 0, @"<nw_endpoint_edge %s %@>", p_identifier, WeakRetained);

  return (NSString *)v5;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->endpoint, 0);
  name = self->name;
  if (name)
  {
    free(name);
    self->name = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NWConcrete_nw_endpoint_edge;
  [(NWConcrete_nw_endpoint_edge *)&v4 dealloc];
}

@end