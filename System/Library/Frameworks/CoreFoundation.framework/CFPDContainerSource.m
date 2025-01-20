@interface CFPDContainerSource
- (CFPDContainerSource)initWithDomain:(__CFString *)a3 userName:(__CFString *)a4 container:(__CFString *)a5 byHost:(BOOL)a6 managed:(BOOL)a7 shmemIndex:(signed __int16)a8 daemon:(id)a9;
- (__CFString)container;
- (void)dealloc;
@end

@implementation CFPDContainerSource

- (__CFString)container
{
  return self->_containerPath;
}

- (CFPDContainerSource)initWithDomain:(__CFString *)a3 userName:(__CFString *)a4 container:(__CFString *)a5 byHost:(BOOL)a6 managed:(BOOL)a7 shmemIndex:(signed __int16)a8 daemon:(id)a9
{
  uint64_t v14 = *(void *)off_1ECE0A5B0;
  v13.receiver = self;
  v13.super_class = (Class)CFPDContainerSource;
  v10 = [(CFPDSource *)&v13 initWithDomain:a3 userName:a4 byHost:a6 managed:a7 shmemIndex:a8 daemon:a9];
  if (v10)
  {
    if (a5) {
      v11 = (__CFString *)CFRetain(a5);
    }
    else {
      v11 = 0;
    }
    v10->_containerPath = v11;
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  containerPath = self->_containerPath;
  if (containerPath) {
    CFRelease(containerPath);
  }
  v4.receiver = self;
  v4.super_class = (Class)CFPDContainerSource;
  [(CFPDSource *)&v4 dealloc];
}

@end