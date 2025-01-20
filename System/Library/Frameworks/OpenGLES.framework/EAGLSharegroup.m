@interface EAGLSharegroup
- (EAGLSharegroup)init;
- (EAGLSharegroup)initWithAPI:(unint64_t)a3;
- (EAGLSharegroup)initWithAPI:(unint64_t)a3 sharedWithCompute:(BOOL)a4;
- (NSString)debugLabel;
- (__GLISharedRec)getGLIShared;
- (unint64_t)APIs;
- (void)dealloc;
- (void)loadGLIPlugin:(__GLDPixelFormatRec *)a3 sharedWithCompute:(BOOL)a4;
- (void)setDebugLabel:(NSString *)debugLabel;
@end

@implementation EAGLSharegroup

- (void)loadGLIPlugin:(__GLDPixelFormatRec *)a3 sharedWithCompute:(BOOL)a4
{
  *((void *)self->_private + 2) = a3;
  *((void *)self->_private + 3) = gfxCreateSharedState();
  if (*((void *)self->_private + 3))
  {
    gfxRetainSharedStateAndHash();
    *((_DWORD *)self->_private + 2) = 1;
  }
}

- (EAGLSharegroup)init
{
  return 0;
}

- (EAGLSharegroup)initWithAPI:(unint64_t)a3
{
  return [(EAGLSharegroup *)self initWithAPI:a3 sharedWithCompute:0];
}

- (EAGLSharegroup)initWithAPI:(unint64_t)a3 sharedWithCompute:(BOOL)a4
{
  if (a3 - 1 >= 3)
  {

    return 0;
  }
  BOOL v4 = a4;
  int v6 = dword_2107FF314[a3 - 1];
  v13.receiver = self;
  v13.super_class = (Class)EAGLSharegroup;
  v7 = [(EAGLSharegroup *)&v13 init];
  if (v7)
  {
    v8 = (_EAGLSharegroupPrivate *)malloc_type_calloc(1uLL, 0x20uLL, 0x1020040FD9D5386uLL);
    v7->_private = v8;
    if (!v8) {
      goto LABEL_13;
    }
    *((unsigned char *)v8 + 12) = 1;
    if ((eagl_init(0) & 1) == 0) {
      goto LABEL_13;
    }
    v9 = v7->_private;
    *(void *)v9 = a3;
    uint64_t v10 = gli_pixelformat;
    if (gli_pixelformat)
    {
      while (1)
      {
        v9 = v7->_private;
        if (*((_DWORD *)v9 + 2)) {
          break;
        }
        int v11 = *(_DWORD *)(v10 + 12);
        if ((v11 & 0x100) != 0 && (v6 & ~v11) == 0) {
          [(EAGLSharegroup *)v7 loadGLIPlugin:v10 sharedWithCompute:v4];
        }
        uint64_t v10 = *(void *)v10;
        if (!v10)
        {
          v9 = v7->_private;
          break;
        }
      }
    }
    if (!*((_DWORD *)v9 + 2))
    {
LABEL_13:

      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  v3 = self->_private;
  if (v3)
  {
    if (*((_DWORD *)v3 + 2) == 1 && *((void *)v3 + 3))
    {
      gfxReleaseSharedStateAndHash();
      *((void *)self->_private + 3) = 0;
      v3 = self->_private;
    }
    *((void *)v3 + 2) = 0;
    BOOL v4 = self->_private;
    if (*((unsigned char *)v4 + 12))
    {
      eagl_dealloc();
      BOOL v4 = self->_private;
    }
    free(v4);
    self->_private = 0;
  }
  [(EAGLSharegroup *)self setDebugLabel:0];
  v5.receiver = self;
  v5.super_class = (Class)EAGLSharegroup;
  [(EAGLSharegroup *)&v5 dealloc];
}

- (unint64_t)APIs
{
  return *(void *)self->_private;
}

- (__GLISharedRec)getGLIShared
{
  return (__GLISharedRec *)*((void *)self->_private + 3);
}

- (NSString)debugLabel
{
  return self->debugLabel;
}

- (void)setDebugLabel:(NSString *)debugLabel
{
}

@end