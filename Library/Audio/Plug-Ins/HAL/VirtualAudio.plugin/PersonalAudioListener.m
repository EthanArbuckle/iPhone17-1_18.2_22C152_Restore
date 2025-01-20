@interface PersonalAudioListener
+ (id)sharedInstance;
- (PersonalAudioListener)init;
- (id).cxx_construct;
- (void)_fire;
- (void)addListener:(function<void)( withID:;
- (void)dealloc;
- (void)removeListener:(unsigned int)a3;
@end

@implementation PersonalAudioListener

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 850045863;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((void *)self + 11) = 0;
  return self;
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 32));
  uint64_t v3 = *((void *)self + 1);
  if (v3)
  {
    uint64_t v4 = *((void *)self + 2);
    v5 = (void *)*((void *)self + 1);
    if (v4 != v3)
    {
      do
      {
        uint64_t v6 = v4 - 40;
        sub_4F750((void *)(v4 - 32));
        uint64_t v4 = v6;
      }
      while (v6 != v3);
      v5 = (void *)*((void *)self + 1);
    }
    *((void *)self + 2) = v3;
    operator delete(v5);
  }
}

- (void)dealloc
{
  uint64_t v3 = +[PASettings sharedInstance];
  [v3 registerUpdateBlock:0 forRetrieveSelector:"personalMediaEnabledByRouteUID" withListener:self];

  uint64_t v4 = +[PASettings sharedInstance];
  [v4 registerUpdateBlock:0 forRetrieveSelector:"personalMediaConfigurationByRouteUID" withListener:self];

  v5 = +[PASettings sharedInstance];
  [v5 registerUpdateBlock:0 forRetrieveSelector:"accommodationTypesByRouteUID" withListener:self];

  v6.receiver = self;
  v6.super_class = (Class)PersonalAudioListener;
  [(PersonalAudioListener *)&v6 dealloc];
}

- (PersonalAudioListener)init
{
  v18.receiver = self;
  v18.super_class = (Class)PersonalAudioListener;
  v2 = [(PersonalAudioListener *)&v18 init];
  uint64_t v3 = +[PASettings sharedInstance];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_3DDA6C;
  v16[3] = &unk_63C0C8;
  uint64_t v4 = v2;
  v17 = v4;
  [v3 registerUpdateBlock:v16 forRetrieveSelector:"personalMediaEnabledByRouteUID" withListener:v4];

  v5 = +[PASettings sharedInstance];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_3DDB40;
  v14[3] = &unk_63C0C8;
  objc_super v6 = v4;
  v15 = v6;
  [v5 registerUpdateBlock:v14 forRetrieveSelector:"personalMediaConfigurationByRouteUID" withListener:v6];

  v7 = +[PASettings sharedInstance];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_3DDC14;
  v12[3] = &unk_63C0C8;
  v8 = v6;
  v13 = v8;
  [v7 registerUpdateBlock:v12 forRetrieveSelector:"accommodationTypesByRouteUID" withListener:v8];

  v9 = v13;
  v10 = v8;

  return v10;
}

- (void)_fire
{
  v2 = self;
  uint64_t v3 = sub_13910();
  uint64_t v4 = v2;
  id v5 = v3;
  operator new();
}

- (void)removeListener:(unsigned int)a3
{
  id v5 = (std::mutex *)((char *)self + 32);
  std::mutex::lock((std::mutex *)((char *)self + 32));
  v7 = (int *)*((void *)self + 1);
  objc_super v6 = (int *)*((void *)self + 2);
  uint64_t v8 = (uint64_t)v6;
  if (v7 != v6)
  {
    v9 = v15;
    while (1)
    {
      int v13 = *v7;
      v10 = (void *)sub_4F7D4((uint64_t)v9, (uint64_t)(v7 + 2));
      v9 = sub_4F750(v10);
      if (v13 == a3) {
        break;
      }
      v7 += 10;
      if (v7 == v6) {
        goto LABEL_14;
      }
    }
    if (v7 != v6)
    {
      v11 = v7 + 10;
      if (v7 + 10 == v6)
      {
        uint64_t v8 = (uint64_t)v7;
      }
      else
      {
        uint64_t v8 = (uint64_t)v7;
        do
        {
          int v14 = *v11;
          sub_4F7D4((uint64_t)v15, (uint64_t)(v11 + 2));
          sub_4F750(v15);
          if (v14 != a3)
          {
            sub_3DE344(v8, (uint64_t)v11);
            v8 += 40;
          }
          v11 += 10;
        }
        while (v11 != v6);
      }
    }
  }
LABEL_14:
  uint64_t v12 = *((void *)self + 2);
  if (v8 != v12)
  {
    do
    {
      sub_4F750((void *)(v12 - 32));
      v12 -= 40;
    }
    while (v12 != v8);
    *((void *)self + 2) = v8;
  }
  std::mutex::unlock(v5);
}

- (void)addListener:(function<void)( withID:
{
  v7 = (std::mutex *)((char *)self + 32);
  std::mutex::lock((std::mutex *)((char *)self + 32));
  sub_4F7D4((uint64_t)v23, (uint64_t)a3);
  v9 = (unsigned int *)*((void *)self + 2);
  unint64_t v8 = *((void *)self + 3);
  if ((unint64_t)v9 < v8)
  {
    unsigned int *v9 = a4;
    v10 = v9 + 10;
    sub_FF780((uint64_t)(v9 + 2), (uint64_t)v23);
    goto LABEL_20;
  }
  uint64_t v11 = *((void *)self + 1);
  unint64_t v12 = 0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v9 - v11) >> 3);
  unint64_t v13 = v12 + 1;
  if (v12 + 1 > 0x666666666666666) {
    sub_60548();
  }
  unint64_t v14 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v8 - v11) >> 3);
  if (2 * v14 > v13) {
    unint64_t v13 = 2 * v14;
  }
  if (v14 >= 0x333333333333333) {
    unint64_t v15 = 0x666666666666666;
  }
  else {
    unint64_t v15 = v13;
  }
  if (v15)
  {
    if (v15 > 0x666666666666666) {
      sub_60560();
    }
    v16 = (char *)operator new(40 * v15);
  }
  else
  {
    v16 = 0;
  }
  v17 = (unsigned int *)&v16[40 * v12];
  objc_super v18 = &v16[40 * v15];
  unsigned int *v17 = a4;
  v10 = v17 + 10;
  sub_FF780((uint64_t)(v17 + 2), (uint64_t)v23);
  v20 = (char *)*((void *)self + 1);
  v19 = (char *)*((void *)self + 2);
  if (v19 == v20)
  {
    *((void *)self + 1) = v17;
    *((void *)self + 2) = v10;
    *((void *)self + 3) = v18;
    if (!v19) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  do
  {
    unsigned int v21 = *((_DWORD *)v19 - 10);
    v19 -= 40;
    *(v17 - 10) = v21;
    v17 -= 10;
    sub_FF780((uint64_t)(v17 + 2), (uint64_t)(v19 + 8));
  }
  while (v19 != v20);
  v22 = (char *)*((void *)self + 1);
  v19 = (char *)*((void *)self + 2);
  *((void *)self + 1) = v17;
  *((void *)self + 2) = v10;
  *((void *)self + 3) = v18;
  if (v19 != v22)
  {
    do
    {
      sub_4F750((void *)v19 - 4);
      v19 -= 40;
    }
    while (v19 != v22);
    v19 = v22;
  }
  if (v19) {
LABEL_19:
  }
    operator delete(v19);
LABEL_20:
  *((void *)self + 2) = v10;
  sub_4F750(v23);
  std::mutex::unlock(v7);
}

+ (id)sharedInstance
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_65FAE8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_65FAE8))
  {
    qword_65FAE0 = objc_alloc_init(PersonalAudioListener);
    __cxa_guard_release(&qword_65FAE8);
  }
  v2 = (void *)qword_65FAE0;

  return v2;
}

@end