void sub_4784(id a1)
{
  uint64_t vars8;

  qword_15388 = objc_alloc_init(IDEDataProvider_SpriteKit);
  _objc_release_x1();
}

void sub_4858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_48BC(id a1)
{
  v4[0] = @"spritekit.fps";
  v4[1] = @"spritekit.traversals";
  v4[2] = @"spritekit.frametime";
  v4[3] = @"spritekit.clienttime";
  v4[4] = @"spritekit.physictime";
  v4[5] = @"spritekit.consttime";
  v4[6] = @"spritekit.actiontime";
  v4[7] = @"spritekit.emittertime";
  v4[8] = @"spritekit.rendertime";
  v1 = +[NSArray arrayWithObjects:v4 count:9];
  uint64_t v2 = +[NSSet setWithArray:v1];
  v3 = (void *)qword_15398;
  qword_15398 = v2;
}

void sub_49B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4AAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4ABC(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8 * i);
        v7 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKey:v6];
        [v7 BOOLValue];
        [*(id *)(a1 + 48) addObject:v6];
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

void sub_4BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4C60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4D28(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8 * i);
        v7 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKey:v6];
        if ([v7 BOOLValue]) {
          [*(id *)(*(void *)(a1 + 40) + 24) removeObjectForKey:v6];
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

void sub_4E60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4F98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4FAC(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8 * (void)v5);
        v7 = +[NSMutableDictionary dictionary];
        if ([*(id *)(a1 + 40) captureAttributes:*(void *)(a1 + 48) toDictionary:v7 forPID:v6])[*(id *)(a1 + 56) setObject:v7 forKeyedSubscript:v6];

        }
        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

void sub_50E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_51BC(id a1)
{
  qword_153A8 = objc_alloc_init(IDEDataProvider_NetworkStatistics);
  _objc_release_x1();
}

void sub_52E0(id a1)
{
  qword_153B8 = +[NSSet setWithArray:&off_11818];
  _objc_release_x1();
}

void sub_5B34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  operator delete(v12);

  _Unwind_Resume(a1);
}

void sub_5C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)IDEDataProvider_NetworkStatistics;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_5CC4(void *a1)
{
}

void sub_5E80(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 40))
  {
    dispatch_queue_t v3 = dispatch_queue_create("NStatManager queue", 0);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    uint64_t v6 = *(void *)(a1 + 32);
    block[5] = _NSConcreteStackBlock;
    block[6] = 3221225472;
    block[7] = sub_60B4;
    block[8] = &unk_10578;
    block[9] = v6;
    *(void *)(*(void *)(a1 + 32) + 40) = NStatManagerCreate();
    NStatManagerAddAllUDP();
    NStatManagerAddAllTCP();
    uint64_t v2 = *(void *)(a1 + 32);
  }
  v7 = *(NSObject **)(v2 + 48);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_737C;
  block[3] = &unk_105A0;
  block[4] = v2;
  dispatch_sync(v7, block);
  long long v8 = +[NSDate date];
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v9 = v8;
  NStatManagerQueryAllSourcesUpdate();
}

void sub_607C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
}

uint64_t sub_60B4(uint64_t a1, const void *a2)
{
  return NStatSourceSetRemovedBlock();
}

void sub_6208(uint64_t a1, void *a2)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 48));
  id v4 = a2;
  v5 = sub_6790(*(void *)(a1 + 32) + 96, (uint64_t *)(a1 + 40));
  id v6 = v4;
  v7 = [v6 objectForKeyedSubscript:kNStatSrcKeyPID];
  id v8 = [v7 copy];
  id v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)*v5;
  }
  objc_storeStrong((id *)v5, v10);

  id v11 = [v6 objectForKeyedSubscript:kNStatSrcKeyInterface];
  id v12 = [v11 integerValue];
  if (qword_153D0 != -1) {
    dispatch_once(&qword_153D0, &stru_105E8);
  }
  v13 = (void *)qword_153C8;
  v14 = +[NSNumber numberWithUnsignedLong:v12];
  v15 = [v13 objectForKey:v14];

  v16 = v15;
  if (!v15)
  {
    long long v43 = xmmword_C950;
    int v44 = (int)v12;
    int v45 = 1;
    size_t v41 = 180;
    if (sysctl((int *)&v43, 6u, uu, &v41, 0, 0)
      || (+[NSString stringWithUTF8String:uu],
          (v15 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v15 = +[NSString stringWithFormat:@"%i", v12];
    }
    v17 = (void *)qword_153C8;
    v18 = +[NSNumber numberWithUnsignedLong:v12];
    [v17 setObject:v15 forKey:v18];

    v16 = v15;
    if (!v15) {
      v16 = (void *)v5[41];
    }
  }
  objc_storeStrong((id *)v5 + 41, v16);

  v19 = [v6 objectForKeyedSubscript:kNStatSrcKeyProvider];
  id v20 = [v19 copy];
  v21 = v20;
  v22 = (void **)(v5 + 42);
  if (v20) {
    v23 = v20;
  }
  else {
    v23 = (void *)v5[42];
  }
  objc_storeStrong((id *)v5 + 42, v23);

  v24 = [v6 objectForKeyedSubscript:kNStatSrcKeyTCPState];
  id v25 = [v24 copy];
  if (v25) {
    v26 = v25;
  }
  else {
    v26 = (void *)v5[43];
  }
  objc_storeStrong((id *)v5 + 43, v26);

  v27 = [v6 objectForKeyedSubscript:kNStatSrcKeyLocal];
  v28 = v27;
  if (v27)
  {
    id v29 = v27;
    sub_77F8((unsigned __int8 *)v5 + 8, (unsigned __int8 *)[v29 bytes], (size_t)[v29 length]);
    sub_78A0((const sockaddr *)(v5 + 1), *v22);
  }
  v30 = [v6 objectForKeyedSubscript:kNStatSrcKeyRemote];
  v31 = v30;
  if (v30)
  {
    id v32 = v30;
    sub_77F8((unsigned __int8 *)v5 + 64, (unsigned __int8 *)[v32 bytes], (size_t)[v32 length]);
    sub_78A0((const sockaddr *)v5 + 4, *v22);
  }
  v33 = [v6 objectForKeyedSubscript:@"fuuid"];
  if ([v33 length])
  {
    id v34 = [objc_alloc((Class)NSUUID) initWithUUIDString:v33];
    memset(uu, 0, 16);
    [v34 getUUIDBytes:uu];
    if (v34 && !uuid_is_null(uu))
    {
      while (1)
      {
        v38 = nw_path_copy_path_for_client();
        v39 = v38;
        if (!v38 || nw_path_get_status(v38) == nw_path_status_invalid)
        {
          uint64_t v35 = 0;
          goto LABEL_35;
        }
        v36 = (void *)nw_path_copy_parameters();
        uint64_t account_id = nw_parameters_get_account_id();
        if (account_id)
        {
          uint64_t v35 = +[NSString stringWithUTF8String:account_id];
          goto LABEL_34;
        }
        long long v43 = 0uLL;
        nw_parameters_get_parent_id();
        if (uuid_is_null((const unsigned __int8 *)&v43)) {
          break;
        }
        *(_OWORD *)uu = v43;
      }
      uint64_t v35 = 0;
LABEL_34:

LABEL_35:
    }
    else
    {
      uint64_t v35 = 0;
    }

    v40 = (void *)v5[45];
    v5[45] = v35;
  }
}

void sub_66AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_6790(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  unint64_t v6 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v5 >> 47) ^ v5);
  unint64_t v7 = 0x9DDFEA08EB382D69 * (v6 ^ (v6 >> 47));
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v2 = 0x9DDFEA08EB382D69 * (v6 ^ (v6 >> 47));
      if (v7 >= v8) {
        unint64_t v2 = v7 % v8;
      }
    }
    else
    {
      unint64_t v2 = v7 & (v8 - 1);
    }
    id v10 = *(void **)(*(void *)a1 + 8 * v2);
    if (v10)
    {
      id v11 = (void *)*v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v4) {
              return v11 + 3;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v2) {
              break;
            }
          }
          id v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  v13 = (void *)(a1 + 16);
  v14 = (char *)operator new(0x188uLL);
  v36[0] = v14;
  v36[1] = a1 + 16;
  *(void *)v14 = 0;
  *((void *)v14 + 1) = v7;
  *((void *)v14 + 2) = v4;
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 56) = 0u;
  *(_OWORD *)(v14 + 72) = 0u;
  *(_OWORD *)(v14 + 88) = 0u;
  *(_OWORD *)(v14 + 104) = 0u;
  *(_OWORD *)(v14 + 120) = 0u;
  *(_OWORD *)(v14 + 136) = 0u;
  *(_OWORD *)(v14 + 152) = 0u;
  *(_OWORD *)(v14 + 168) = 0u;
  *(_OWORD *)(v14 + 184) = 0u;
  *(_OWORD *)(v14 + 200) = 0u;
  *(_OWORD *)(v14 + 216) = 0u;
  *(_OWORD *)(v14 + 232) = 0u;
  *(_OWORD *)(v14 + 248) = 0u;
  *(_OWORD *)(v14 + 264) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  *(_OWORD *)(v14 + 280) = 0u;
  *(_OWORD *)(v14 + 296) = 0u;
  *(_OWORD *)(v14 + 312) = 0u;
  *(_OWORD *)(v14 + 328) = 0u;
  *(_OWORD *)(v14 + 344) = 0u;
  *(_OWORD *)(v14 + 360) = 0u;
  *(_OWORD *)(v14 + 376) = 0u;
  sub_7A5C((void *)v14 + 18, 0);
  sub_7A5C((void *)v14 + 31, 0);
  *((void *)v14 + 48) = 0;
  *((_OWORD *)v14 + 22) = 0u;
  *((_OWORD *)v14 + 23) = 0u;
  char v37 = 1;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = (v8 & (v8 - 1)) == 0;
    if (v8 < 3) {
      BOOL v17 = 0;
    }
    unint64_t v18 = (2 * v8) | !v17;
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      int8x8_t prime = (int8x8_t)v19;
    }
    else {
      int8x8_t prime = (int8x8_t)v18;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v8 = *(void *)(a1 + 8);
    if (*(void *)&prime > v8) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v8)
    {
      unint64_t v27 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v8 < 3 || (uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
      {
        unint64_t v27 = std::__next_prime(v27);
      }
      else
      {
        uint64_t v29 = 1 << -(char)__clz(v27 - 1);
        if (v27 >= 2) {
          unint64_t v27 = v29;
        }
      }
      if (*(void *)&prime <= v27) {
        int8x8_t prime = (int8x8_t)v27;
      }
      if (*(void *)&prime >= v8)
      {
        unint64_t v8 = *(void *)(a1 + 8);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            sub_7F0C();
          }
          v21 = operator new(8 * *(void *)&prime);
          v22 = *(void **)a1;
          *(void *)a1 = v21;
          if (v22) {
            operator delete(v22);
          }
          uint64_t v23 = 0;
          *(int8x8_t *)(a1 + 8) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v23++) = 0;
          while (*(void *)&prime != v23);
          v24 = (void *)*v13;
          if (*v13)
          {
            unint64_t v25 = v24[1];
            uint8x8_t v26 = (uint8x8_t)vcnt_s8(prime);
            v26.i16[0] = vaddlv_u8(v26);
            if (v26.u32[0] > 1uLL)
            {
              if (v25 >= *(void *)&prime) {
                v25 %= *(void *)&prime;
              }
            }
            else
            {
              v25 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)a1 + 8 * v25) = v13;
            v30 = (void *)*v24;
            if (*v24)
            {
              do
              {
                unint64_t v31 = v30[1];
                if (v26.u32[0] > 1uLL)
                {
                  if (v31 >= *(void *)&prime) {
                    v31 %= *(void *)&prime;
                  }
                }
                else
                {
                  v31 &= *(void *)&prime - 1;
                }
                if (v31 != v25)
                {
                  if (!*(void *)(*(void *)a1 + 8 * v31))
                  {
                    *(void *)(*(void *)a1 + 8 * v31) = v24;
                    goto LABEL_55;
                  }
                  void *v24 = *v30;
                  void *v30 = **(void **)(*(void *)a1 + 8 * v31);
                  **(void **)(*(void *)a1 + 8 * v31) = v30;
                  v30 = v24;
                }
                unint64_t v31 = v25;
LABEL_55:
                v24 = v30;
                v30 = (void *)*v30;
                unint64_t v25 = v31;
              }
              while (v30);
            }
          }
          unint64_t v8 = (unint64_t)prime;
          goto LABEL_59;
        }
        uint64_t v35 = *(void **)a1;
        *(void *)a1 = 0;
        if (v35) {
          operator delete(v35);
        }
        unint64_t v8 = 0;
        *(void *)(a1 + 8) = 0;
      }
    }
LABEL_59:
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v2 = v7 % v8;
      }
      else {
        unint64_t v2 = v7;
      }
    }
    else
    {
      unint64_t v2 = (v8 - 1) & v7;
    }
  }
  id v32 = *(void **)(*(void *)a1 + 8 * v2);
  if (v32)
  {
    *(void *)v36[0] = *v32;
    *id v32 = v36[0];
  }
  else
  {
    *(void *)v36[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v36[0];
    *(void *)(*(void *)a1 + 8 * v2) = v13;
    if (*(void *)v36[0])
    {
      unint64_t v33 = *(void *)(*(void *)v36[0] + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v33 >= v8) {
          v33 %= v8;
        }
      }
      else
      {
        v33 &= v8 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v33) = v36[0];
    }
  }
  id v11 = (void *)v36[0];
  v36[0] = 0;
  ++*(void *)(a1 + 24);
  sub_7F40((uint64_t)v36);
  return v11 + 3;
}

void sub_6C58(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_7F40((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_6CAC(uint64_t a1, void *a2)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 48));
  id v5 = a2;
  unint64_t v6 = sub_6790(*(void *)(a1 + 32) + 96, (uint64_t *)(a1 + 40));
  long long v7 = *((_OWORD *)v6 + 16);
  *(_OWORD *)(v6 + 21) = *((_OWORD *)v6 + 17);
  long long v8 = *((_OWORD *)v6 + 19);
  *(_OWORD *)(v6 + 23) = *((_OWORD *)v6 + 18);
  *(_OWORD *)(v6 + 25) = v8;
  v6[27] = v6[40];
  long long v9 = *((_OWORD *)v6 + 15);
  *(_OWORD *)(v6 + 15) = *((_OWORD *)v6 + 14);
  *(_OWORD *)(v6 + 17) = v9;
  *(_OWORD *)(v6 + 19) = v7;
  sub_7A5C(v35, v5);
  long long v10 = v35[5];
  *((_OWORD *)v6 + 18) = v35[4];
  *((_OWORD *)v6 + 19) = v10;
  v6[40] = v36;
  long long v11 = v35[1];
  *((_OWORD *)v6 + 14) = v35[0];
  *((_OWORD *)v6 + 15) = v11;
  long long v12 = v35[3];
  *((_OWORD *)v6 + 16) = v35[2];
  *((_OWORD *)v6 + 17) = v12;
  signed int v13 = [(id)*v6 intValue];
  signed int v14 = v13;
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = v15 + 56;
  unint64_t v17 = v13;
  unint64_t v18 = *(void *)(v15 + 64);
  if (v18)
  {
    uint8x8_t v19 = (uint8x8_t)vcnt_s8((int8x8_t)v18);
    v19.i16[0] = vaddlv_u8(v19);
    if (v19.u32[0] > 1uLL)
    {
      unint64_t v2 = v13;
      if (v18 <= v13) {
        unint64_t v2 = v13 % v18;
      }
    }
    else
    {
      unint64_t v2 = (v18 - 1) & v13;
    }
    id v20 = *(void ***)(*(void *)v16 + 8 * v2);
    if (v20)
    {
      v21 = (char *)*v20;
      if (*v20)
      {
        do
        {
          unint64_t v22 = *((void *)v21 + 1);
          if (v22 == v13)
          {
            if (*((_DWORD *)v21 + 4) == v13) {
              goto LABEL_40;
            }
          }
          else
          {
            if (v19.u32[0] > 1uLL)
            {
              if (v22 >= v18) {
                v22 %= v18;
              }
            }
            else
            {
              v22 &= v18 - 1;
            }
            if (v22 != v2) {
              break;
            }
          }
          v21 = *(char **)v21;
        }
        while (v21);
      }
    }
  }
  v21 = (char *)operator new(0xE8uLL);
  *(void *)v21 = 0;
  *((void *)v21 + 1) = v17;
  *((_DWORD *)v21 + 4) = v14;
  *(_OWORD *)(v21 + 40) = 0u;
  *(_OWORD *)(v21 + 56) = 0u;
  *(_OWORD *)(v21 + 72) = 0u;
  *(_OWORD *)(v21 + 88) = 0u;
  *(_OWORD *)(v21 + 104) = 0u;
  *(_OWORD *)(v21 + 120) = 0u;
  *(_OWORD *)(v21 + 136) = 0u;
  *(_OWORD *)(v21 + 152) = 0u;
  *(_OWORD *)(v21 + 168) = 0u;
  *(_OWORD *)(v21 + 184) = 0u;
  *(_OWORD *)(v21 + 200) = 0u;
  *(_OWORD *)(v21 + 216) = 0u;
  *(_OWORD *)(v21 + 24) = 0u;
  sub_7A5C((void *)v21 + 3, 0);
  sub_7A5C((void *)v21 + 16, 0);
  float v23 = (float)(unint64_t)(*(void *)(v16 + 24) + 1);
  float v24 = *(float *)(v16 + 32);
  if (!v18 || (float)(v24 * (float)v18) < v23)
  {
    BOOL v25 = 1;
    if (v18 >= 3) {
      BOOL v25 = (v18 & (v18 - 1)) != 0;
    }
    unint64_t v26 = v25 | (2 * v18);
    unint64_t v27 = vcvtps_u32_f32(v23 / v24);
    if (v26 <= v27) {
      size_t v28 = v27;
    }
    else {
      size_t v28 = v26;
    }
    sub_7D10(v16, v28);
    unint64_t v18 = *(void *)(v16 + 8);
    if ((v18 & (v18 - 1)) != 0)
    {
      if (v18 <= v17) {
        unint64_t v2 = v17 % v18;
      }
      else {
        unint64_t v2 = v17;
      }
    }
    else
    {
      unint64_t v2 = (v18 - 1) & v17;
    }
  }
  uint64_t v29 = *(void *)v16;
  v30 = *(void **)(*(void *)v16 + 8 * v2);
  if (v30)
  {
    *(void *)v21 = *v30;
LABEL_38:
    void *v30 = v21;
    goto LABEL_39;
  }
  *(void *)v21 = *(void *)(v16 + 16);
  *(void *)(v16 + 16) = v21;
  *(void *)(v29 + 8 * v2) = v16 + 16;
  if (*(void *)v21)
  {
    unint64_t v31 = *(void *)(*(void *)v21 + 8);
    if ((v18 & (v18 - 1)) != 0)
    {
      if (v31 >= v18) {
        v31 %= v18;
      }
    }
    else
    {
      v31 &= v18 - 1;
    }
    v30 = (void *)(*(void *)v16 + 8 * v31);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(v16 + 24);
LABEL_40:
  int64x2_t v32 = *((int64x2_t *)v21 + 9);
  *((int64x2_t *)v21 + 8) = vaddq_s64(vsubq_s64(*((int64x2_t *)v6 + 14), *(int64x2_t *)(v6 + 15)), *((int64x2_t *)v21 + 8));
  *((int64x2_t *)v21 + 9) = vaddq_s64(vsubq_s64(*((int64x2_t *)v6 + 15), *(int64x2_t *)(v6 + 17)), v32);
  int64x2_t v33 = *((int64x2_t *)v21 + 11);
  *((int64x2_t *)v21 + 10) = vaddq_s64(vsubq_s64(*((int64x2_t *)v6 + 16), *(int64x2_t *)(v6 + 19)), *((int64x2_t *)v21 + 10));
  *((int64x2_t *)v21 + 11) = vaddq_s64(vsubq_s64(*((int64x2_t *)v6 + 17), *(int64x2_t *)(v6 + 21)), v33);
  int64x2_t v34 = *((int64x2_t *)v21 + 13);
  *((int64x2_t *)v21 + 12) = vaddq_s64(vsubq_s64(*((int64x2_t *)v6 + 18), *(int64x2_t *)(v6 + 23)), *((int64x2_t *)v21 + 12));
  *((int64x2_t *)v21 + 13) = vaddq_s64(vsubq_s64(*((int64x2_t *)v6 + 19), *(int64x2_t *)(v6 + 25)), v34);
  *((void *)v21 + 28) += v6[40] - v6[27];
}

void sub_7058(_Unwind_Exception *a1)
{
  operator delete(v2);

  _Unwind_Resume(a1);
}

void sub_7084(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 48));
  unint64_t v2 = NStatSourceCopyCounts();
  dispatch_queue_t v3 = sub_6790(*(void *)(a1 + 32) + 96, (uint64_t *)(a1 + 40));
  if (v2)
  {
    uint64_t v4 = v3;
    long long v5 = *((_OWORD *)v3 + 16);
    *(_OWORD *)(v3 + 21) = *((_OWORD *)v3 + 17);
    long long v6 = *((_OWORD *)v3 + 19);
    *(_OWORD *)(v3 + 23) = *((_OWORD *)v3 + 18);
    *(_OWORD *)(v3 + 25) = v6;
    v3[27] = v3[40];
    long long v7 = *((_OWORD *)v3 + 15);
    *(_OWORD *)(v3 + 15) = *((_OWORD *)v3 + 14);
    *(_OWORD *)(v3 + 17) = v7;
    *(_OWORD *)(v3 + 19) = v5;
    sub_7A5C(&v30, v2);
    long long v8 = v35;
    *((_OWORD *)v4 + 18) = v34;
    *((_OWORD *)v4 + 19) = v8;
    v4[40] = v36;
    long long v9 = v31;
    *((_OWORD *)v4 + 14) = v30;
    *((_OWORD *)v4 + 15) = v9;
    long long v10 = v33;
    *((_OWORD *)v4 + 16) = v32;
    *((_OWORD *)v4 + 17) = v10;
  }
  unint64_t v11 = *(void *)(a1 + 40);
  long long v12 = (uint64_t *)(*(void *)(a1 + 32) + 96);
  int8x8_t v13 = *(int8x8_t *)(*(void *)(a1 + 32) + 104);
  if (!*(void *)&v13) {
    goto LABEL_49;
  }
  unint64_t v14 = 0x9DDFEA08EB382D69 * (((8 * v11) + 8) ^ HIDWORD(v11));
  unint64_t v15 = 0x9DDFEA08EB382D69 * (HIDWORD(v11) ^ (v14 >> 47) ^ v14);
  unint64_t v16 = 0x9DDFEA08EB382D69 * (v15 ^ (v15 >> 47));
  uint8x8_t v17 = (uint8x8_t)vcnt_s8(v13);
  v17.i16[0] = vaddlv_u8(v17);
  if (v17.u32[0] > 1uLL)
  {
    unint64_t v18 = v16;
    if (v16 >= *(void *)&v13) {
      unint64_t v18 = v16 % *(void *)&v13;
    }
  }
  else
  {
    unint64_t v18 = v16 & (*(void *)&v13 - 1);
  }
  uint64_t v19 = *v12;
  id v20 = *(void **)(*v12 + 8 * v18);
  if (!v20) {
    goto LABEL_49;
  }
  v21 = (void *)*v20;
  if (!v21) {
    goto LABEL_49;
  }
  uint64_t v22 = *(void *)&v13 - 1;
  while (1)
  {
    unint64_t v23 = v21[1];
    if (v23 == v16) {
      break;
    }
    if (v17.u32[0] > 1uLL)
    {
      if (v23 >= *(void *)&v13) {
        v23 %= *(void *)&v13;
      }
    }
    else
    {
      v23 &= v22;
    }
    if (v23 != v18) {
      goto LABEL_49;
    }
LABEL_19:
    v21 = (void *)*v21;
    if (!v21) {
      goto LABEL_49;
    }
  }
  if (v21[2] != v11) {
    goto LABEL_19;
  }
  float v24 = (void *)*v21;
  if (v17.u32[0] > 1uLL)
  {
    if (v16 >= *(void *)&v13) {
      v16 %= *(void *)&v13;
    }
  }
  else
  {
    v16 &= v22;
  }
  BOOL v25 = *(void **)(v19 + 8 * v16);
  do
  {
    unint64_t v26 = v25;
    BOOL v25 = (void *)*v25;
  }
  while (v25 != v21);
  if (v26 == (void *)(*(void *)(a1 + 32) + 112)) {
    goto LABEL_38;
  }
  unint64_t v27 = v26[1];
  if (v17.u32[0] > 1uLL)
  {
    if (v27 >= *(void *)&v13) {
      v27 %= *(void *)&v13;
    }
  }
  else
  {
    v27 &= v22;
  }
  if (v27 == v16)
  {
LABEL_40:
    if (v24)
    {
      unint64_t v28 = v24[1];
      goto LABEL_42;
    }
  }
  else
  {
LABEL_38:
    if (!v24) {
      goto LABEL_39;
    }
    unint64_t v28 = v24[1];
    if (v17.u32[0] > 1uLL)
    {
      unint64_t v29 = v24[1];
      if (v28 >= *(void *)&v13) {
        unint64_t v29 = v28 % *(void *)&v13;
      }
    }
    else
    {
      unint64_t v29 = v28 & v22;
    }
    if (v29 != v16)
    {
LABEL_39:
      *(void *)(v19 + 8 * v16) = 0;
      float v24 = (void *)*v21;
      goto LABEL_40;
    }
LABEL_42:
    if (v17.u32[0] > 1uLL)
    {
      if (v28 >= *(void *)&v13) {
        v28 %= *(void *)&v13;
      }
    }
    else
    {
      v28 &= v22;
    }
    if (v28 != v16)
    {
      *(void *)(*v12 + 8 * v28) = v26;
      float v24 = (void *)*v21;
    }
  }
  void *v26 = v24;
  void *v21 = 0;
  --v12[3];
  *(void *)&long long v30 = v21;
  *((void *)&v30 + 1) = v12 + 2;
  LOBYTE(v31) = 1;
  sub_7F40((uint64_t)&v30);
  unint64_t v11 = *(void *)(a1 + 40);
LABEL_49:
  CFRelease((CFTypeRef)v11);
}

void sub_736C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 sub_737C(uint64_t a1)
{
  for (i = *(uint64_t **)(*(void *)(a1 + 32) + 72); i; i = (uint64_t *)*i)
  {
    long long v2 = *((_OWORD *)i + 10);
    *(_OWORD *)(i + 9) = *((_OWORD *)i + 11);
    long long v3 = *((_OWORD *)i + 13);
    *(_OWORD *)(i + 11) = *((_OWORD *)i + 12);
    *(_OWORD *)(i + 13) = v3;
    __n128 result = *((__n128 *)i + 8);
    long long v5 = *((_OWORD *)i + 9);
    *(__n128 *)(i + 3) = result;
    *(_OWORD *)(i + 5) = v5;
    i[15] = i[28];
    *(_OWORD *)(i + 7) = v2;
  }
  return result;
}

void sub_73CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = *(NSObject **)(v2 + 24);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_7494;
  v4[3] = &unk_104C0;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  dispatch_sync(v3, v4);
}

void sub_7494(uint64_t a1)
{
  uint64_t v2 = +[NSMutableDictionary dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *(id *)(a1 + 40);
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v8);
        long long v10 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 32, (void)v11);
        [v10 setObject:v9 forKeyedSubscript:@"pid"];
        [v10 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"time"];
        if ([*(id *)(a1 + 32) captureAttributes:*(void *)(a1 + 56) toDictionary:v10 forPID:v9])[*(id *)(*(void *)(a1 + 32) + 32) setObject:v10 forKeyedSubscript:v9];

        }
        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

void sub_7630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_7660(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_7670(uint64_t a1)
{
}

uint64_t sub_7678(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  return _objc_release_x1();
}

void sub_77F8(unsigned __int8 *__dst, unsigned __int8 *__src, size_t __n)
{
  if (__n - 29 >= 0xFFFFFFFFFFFFFFE4)
  {
    size_t v5 = *__src;
    if (v5 <= __n && (v5 != *__dst || memcmp(__src, __dst, v5)))
    {
      memcpy(__dst, __src, __n);
      uint64_t v7 = (void *)*((void *)__dst + 4);
      *((void *)__dst + 4) = 0;

      long long v8 = (void *)*((void *)__dst + 5);
      *((void *)__dst + 5) = 0;
    }
  }
}

void sub_78A0(const sockaddr *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!*(void *)&a1[2].sa_len || !*(void *)&a1[2].sa_data[6])
  {
    if (v3)
    {
      if ([v3 isEqualToString:@"UDP"]) {
        int v5 = 26;
      }
      else {
        int v5 = 10;
      }
    }
    else
    {
      int v5 = 10;
    }
    int v6 = getnameinfo(a1, a1->sa_len, v16, 0x401u, v15, 0x20u, v5);
    if (v6)
    {
      uint64_t v7 = *(void **)&a1[2].sa_len;
      *(void *)&a1[2].sa_len = @"?";

      long long v8 = *(void **)&a1[2].sa_data[6];
      *(void *)&a1[2].sa_data[6] = @"?";

      uint64_t v9 = +[NSString stringWithUTF8String:gai_strerror(v6)];
      long long v10 = *(void **)&a1[3].sa_len;
      *(void *)&a1[3].sa_len = v9;
    }
    else
    {
      uint64_t v11 = +[NSString stringWithUTF8String:v16];
      long long v12 = *(void **)&a1[2].sa_len;
      *(void *)&a1[2].sa_len = v11;

      uint64_t v13 = +[NSString stringWithUTF8String:v15];
      long long v14 = *(void **)&a1[2].sa_data[6];
      *(void *)&a1[2].sa_data[6] = v13;

      long long v10 = *(void **)&a1[3].sa_len;
      *(void *)&a1[3].sa_len = 0;
    }
  }
}

void sub_7A04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7A20(id a1)
{
  qword_153C8 = (uint64_t)objc_alloc_init((Class)NSCache);
  _objc_release_x1();
}

void *sub_7A5C(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = [v3 objectForKeyedSubscript:kNStatSrcKeyRxPackets];
    *a1 = [v5 integerValue];

    int v6 = [v4 objectForKeyedSubscript:kNStatSrcKeyRxBytes];
    a1[1] = [v6 integerValue];

    uint64_t v7 = [v4 objectForKeyedSubscript:kNStatSrcKeyTxPackets];
    a1[2] = [v7 integerValue];

    long long v8 = [v4 objectForKeyedSubscript:kNStatSrcKeyTxBytes];
    a1[3] = [v8 integerValue];

    uint64_t v9 = [v4 objectForKeyedSubscript:kNStatSrcKeyRxDupeBytes];
    a1[4] = [v9 integerValue];

    long long v10 = [v4 objectForKeyedSubscript:kNStatSrcKeyRxOOOBytes];
    a1[5] = [v10 integerValue];

    uint64_t v11 = [v4 objectForKeyedSubscript:kNStatSrcKeyTxReTx];
    a1[6] = [v11 integerValue];

    long long v12 = [v4 objectForKeyedSubscript:kNStatSrcKeyConnectAttempt];
    a1[7] = [v12 integerValue];

    uint64_t v13 = [v4 objectForKeyedSubscript:kNStatSrcKeyConnectSuccess];
    a1[8] = [v13 integerValue];

    long long v14 = [v4 objectForKeyedSubscript:kNStatSrcKeyRxCellularBytes];
    a1[9] = [v14 integerValue];

    unint64_t v15 = [v4 objectForKeyedSubscript:kNStatSrcKeyTxCellularBytes];
    a1[10] = [v15 integerValue];

    unint64_t v16 = [v4 objectForKeyedSubscript:kNStatSrcKeyRxWiFiBytes];
    a1[11] = [v16 integerValue];

    uint8x8_t v17 = [v4 objectForKeyedSubscript:kNStatSrcKeyTxWiFiBytes];
    a1[12] = [v17 integerValue];
  }
  else
  {
    a1[12] = 0;
    *((_OWORD *)a1 + 4) = 0u;
    *((_OWORD *)a1 + 5) = 0u;
    *((_OWORD *)a1 + 2) = 0u;
    *((_OWORD *)a1 + 3) = 0u;
    *(_OWORD *)a1 = 0u;
    *((_OWORD *)a1 + 1) = 0u;
  }

  return a1;
}

void sub_7CC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7D10(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }
    else
    {
      uint64_t v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }
    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      unint64_t v16 = *(void **)a1;
      *(void *)a1 = 0;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61) {
    sub_7F0C();
  }
  int v5 = operator new(8 * prime);
  int v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  long long v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }
    else
    {
      v9 &= prime - 1;
    }
    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    long long v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *long long v8 = *v14;
          void *v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          long long v14 = v8;
        }
        size_t v15 = v9;
LABEL_31:
        long long v8 = v14;
        long long v14 = (void *)*v14;
        size_t v9 = v15;
      }
      while (v14);
    }
  }
}

void sub_7F0C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t sub_7F40(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_7F88((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
  return a1;
}

void sub_7F88(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
}

void sub_81A8(id a1)
{
  qword_153D8 = objc_alloc_init(IDEDataProvider_Energy);
  _objc_release_x1();
}

void sub_8258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_82BC(id a1)
{
  v4[0] = @"energy.cost";
  v4[1] = @"energy.overhead";
  v4[2] = @"energy.version";
  v4[3] = @"energy.cpu.cost";
  v4[4] = @"energy.cpu.overhead";
  void v4[5] = @"energy.networking.cost";
  v4[6] = @"energy.networkning.overhead";
  v4[7] = @"energy.location.cost";
  v4[8] = @"energy.location.overhead";
  void v4[9] = @"energy.gpu.cost";
  v4[10] = @"energy.gpu.overhead";
  v4[11] = @"energy.display.cost";
  v4[12] = @"energy.display.overhead";
  v4[13] = @"energy.appstate.cost";
  v4[14] = @"energy.appstate.overhead";
  v4[15] = @"energy.thermalstate.cost";
  v4[16] = @"energy.inducedthermalstate.cost";
  v1 = +[NSArray arrayWithObjects:v4 count:17];
  uint64_t v2 = +[NSSet setWithArray:v1];
  id v3 = (void *)qword_153E8;
  qword_153E8 = v2;
}

void sub_8400(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_85C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_8C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_8D5C(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = (int *)[v1 longValue];
    uint64_t v3 = -1;
    uint64_t v4 = 2;
    uint64_t v5 = 3;
    if (v2 != (int *)((char *)&dword_1C + 2)) {
      uint64_t v5 = -1;
    }
    if (v2 != &dword_14) {
      uint64_t v4 = v5;
    }
    if (v2 == (int *)((char *)&dword_8 + 2)) {
      uint64_t v3 = 1;
    }
    if (!v2) {
      uint64_t v3 = 0;
    }
    if ((uint64_t)v2 <= 19) {
      uint64_t v6 = v3;
    }
    else {
      uint64_t v6 = v4;
    }
  }
  else
  {
    uint64_t v6 = -1;
  }

  return v6;
}

void sub_8DEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_9178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_93F0(id a1)
{
  qword_153F8 = objc_alloc_init(IDEDataProvider_SceneKit);
  _objc_release_x1();
}

void sub_94C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9528(id a1)
{
  v4[0] = @"scenekit.fps";
  v4[1] = @"scenekit.primcnt";
  v4[2] = @"scenekit.frmtime";
  v4[3] = @"scenekit.phytime";
  v4[4] = @"scenekit.prttime";
  void v4[5] = @"scenekit.animtime";
  v4[6] = @"scenekit.clientTime";
  v4[7] = @"scenekit.rendertime";
  v4[8] = @"scenekit.consttime";
  void v4[9] = @"scenekit.cpuidletime";
  v4[10] = @"scenekit.cawaittime";
  v4[11] = @"scenekit.shaderGenerationCount";
  v4[12] = @"scenekit.shaderCompilationTime";
  v4[13] = @"scenekit.deviceutil";
  v4[14] = @"scenekit.rendererutil";
  v4[15] = @"scenekit.tilerutil";
  id v1 = +[NSArray arrayWithObjects:v4 count:16];
  uint64_t v2 = +[NSSet setWithArray:v1];
  uint64_t v3 = (void *)qword_15408;
  qword_15408 = v2;
}

void sub_9660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_975C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_976C(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKey:v6];
        if ([v7 BOOLValue])
        {
          [*(id *)(a1 + 48) addObject:v6];
        }
        else
        {
          [v6 intValue];
          if (_SCNStartCollectingPerformanceStatisticsForPid())
          {

            [*(id *)(*(void *)(a1 + 40) + 24) setObject:&__kCFBooleanTrue forKey:v6];
            uint64_t v7 = &__kCFBooleanTrue;
            [*(id *)(a1 + 48) addObject:v6];
          }
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

void sub_98E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9AA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9B04()
{
}

void sub_9BBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9CA4(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKey:v6];
        if ([v7 BOOLValue])
        {
          [v6 intValue];
          _SCNStopCollectingPerformanceStatisticsForPid();
          [*(id *)(*(void *)(a1 + 40) + 24) removeObjectForKey:v6];
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

void sub_9DE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9F20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9F34(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v5);
        uint64_t v7 = +[NSMutableDictionary dictionary];
        unsigned int v8 = [*(id *)(a1 + 40) containsObject:@"shaders"];
        long long v9 = *(void **)(a1 + 48);
        if (!v8)
        {
          if (![v9 captureAttributes:*(void *)(a1 + 40) toDictionary:v7 forPID:v6]) {
            goto LABEL_11;
          }
LABEL_10:
          [*(id *)(a1 + 56) setObject:v7 forKeyedSubscript:v6];
          goto LABEL_11;
        }
        if ([v9 captureShadersToDictionary:v7 forPID:v6]) {
          goto LABEL_10;
        }
LABEL_11:

        uint64_t v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

void sub_A0A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A518(id a1)
{
  qword_15418 = objc_alloc_init(IDEDataProvider_procinfo);
  _objc_release_x1();
}

void sub_A618(id a1)
{
  qword_15428 = +[NSSet setWithArray:&off_11830];
  _objc_release_x1();
}

void sub_B3A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B61C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B630(uint64_t a1)
{
  id v2 = +[NSDate date];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id obj = *(id *)(a1 + 32);
  id v3 = [obj countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8 * (void)v5);
        uint64_t v7 = +[NSMutableDictionary dictionaryWithCapacity:32];
        [v7 setObject:v6 forKeyedSubscript:@"pid"];
        [v7 setObject:v2 forKeyedSubscript:@"time"];
        if ([*(id *)(a1 + 40) captureAttributes:*(void *)(a1 + 48) toDictionary:v7 forPID:v6])[*(id *)(a1 + 56) setObject:v7 forKeyedSubscript:v6];

        }
        uint64_t v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
}

void sub_B7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t NStatManagerAddAllTCP()
{
  return _NStatManagerAddAllTCP();
}

uint64_t NStatManagerAddAllUDP()
{
  return _NStatManagerAddAllUDP();
}

uint64_t NStatManagerCreate()
{
  return _NStatManagerCreate();
}

uint64_t NStatManagerDestroy()
{
  return _NStatManagerDestroy();
}

uint64_t NStatManagerQueryAllSourcesUpdate()
{
  return _NStatManagerQueryAllSourcesUpdate();
}

uint64_t NStatSourceCopyCounts()
{
  return _NStatSourceCopyCounts();
}

uint64_t NStatSourceSetCountsBlock()
{
  return _NStatSourceSetCountsBlock();
}

uint64_t NStatSourceSetDescriptionBlock()
{
  return _NStatSourceSetDescriptionBlock();
}

uint64_t NStatSourceSetRemovedBlock()
{
  return _NStatSourceSetRemovedBlock();
}

uint64_t PLBatteryGaugeGetSnapshot()
{
  return _PLBatteryGaugeGetSnapshot();
}

uint64_t PLBatteryGaugeStartTracingForPid()
{
  return _PLBatteryGaugeStartTracingForPid();
}

uint64_t PLBatteryGaugeStopTracingForPid()
{
  return _PLBatteryGaugeStopTracingForPid();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _SCNGetCollectedShadersForPid()
{
  return __SCNGetCollectedShadersForPid();
}

uint64_t _SCNGetPerformanceStatisticsForPid()
{
  return __SCNGetPerformanceStatisticsForPid();
}

uint64_t _SCNStartCollectingPerformanceStatisticsForPid()
{
  return __SCNStartCollectingPerformanceStatisticsForPid();
}

uint64_t _SCNStopCollectingPerformanceStatisticsForPid()
{
  return __SCNStopCollectingPerformanceStatisticsForPid();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return ___error();
}

uint64_t coalition_info_resource_usage()
{
  return _coalition_info_resource_usage();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

const char *__cdecl gai_strerror(int a1)
{
  return _gai_strerror(a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return _getnameinfo(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

uint64_t nw_parameters_get_account_id()
{
  return _nw_parameters_get_account_id();
}

uint64_t nw_parameters_get_parent_id()
{
  return _nw_parameters_get_parent_id();
}

uint64_t nw_path_copy_parameters()
{
  return _nw_path_copy_parameters();
}

uint64_t nw_path_copy_path_for_client()
{
  return _nw_path_copy_path_for_client();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return _nw_path_get_status(path);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

[super a2];
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return _proc_pid_rusage(pid, flavor, buffer);
}

int proc_pidfdinfo(int pid, int fd, int flavor, void *buffer, int buffersize)
{
  return _proc_pidfdinfo(pid, fd, flavor, buffer, buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int uuid_is_null(const uuid_t uu)
{
  return _uuid_is_null(uu);
}

BOOL objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

[objc_msgSend_date(a1, a2, ...)]
{
  return [a1 date];
}

[objc_msgSend_dictionary(a1, a2, ...)]
{
  return [a1 dictionary];
}

id _initialQueryTimeForPidDictionary(void *a1, const char *a2, ...)
{
  return [a1 initialQueryTimeForPidDictionary];
}

[objc_msgSend_intValue:intValue];
{
  return [a1 intValue];
}

[objc_msgSend_integerValue:a1, a2, ...];
{
  return [a1 integerValue];
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return [a1 length];
}

[objc_msgSend_longValue longValue];
{
  return [a1 longValue];
}

[objc_msgSend_set(a1, a2, ...)]
{
  return [a1 set];
}

id _sharedDataProvider(void *a1, const char *a2, ...)
{
  return [a1 sharedDataProvider];
}

[objc_msgSend_timeIntervalSinceDate_]
{
  return [a1 timeIntervalSinceDate:];
}