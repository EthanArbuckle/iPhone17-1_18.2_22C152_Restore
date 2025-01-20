uint64_t AdminLiteNVRAMSet(const char *a1, const char *a2, int a3)
{
  uint64_t v3;
  uint64_t v7;
  FILE *v8;
  const char *v9;
  FILE *v10;
  char *v11;
  unsigned int v13;
  mach_port_t sp;

  v3 = 1;
  if (a1 && a2)
  {
    sp = 0;
    v7 = bootstrap_look_up(*MEMORY[0x263EF87F0], "com.apple.AdminLite", &sp);
    if (v7)
    {
      v3 = v7;
      v8 = (FILE *)*MEMORY[0x263EF8348];
      v9 = bootstrap_strerror(v7);
      fprintf(v8, "bootstrap_look_up(): %s\n", v9);
    }
    else
    {
      v13 = 0;
      v3 = nvram_set(sp, a1, a2, a3, &v13);
      mach_port_deallocate(*MEMORY[0x263EF8960], sp);
      if (v3)
      {
        v10 = (FILE *)*MEMORY[0x263EF8348];
        v11 = mach_error_string(v3);
        fprintf(v10, "nvram_set(): %08x %s\n", v3, v11);
        return v13;
      }
    }
  }
  return v3;
}

uint64_t nvram_set(mach_port_name_t a1, const char *a2, const char *a3, int a4, _DWORD *a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  memset(v26, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  long long v25 = 0u;
  *((void *)&v25 + 1) = *MEMORY[0x263EF80C8];
  uint64_t v9 = MEMORY[0x263EF89D0];
  if (MEMORY[0x263EF89D0]) {
    int v10 = mig_strncpy_zerofill((char *)v26 + 8, a2, 1024);
  }
  else {
    int v10 = mig_strncpy((char *)v26 + 8, a2, 1024);
  }
  LODWORD(v26[0]) = 0;
  DWORD1(v26[0]) = v10;
  uint64_t v11 = (v10 + 3) & 0xFFFFFFFC;
  int v12 = v11 + 52;
  v13 = (char *)rcv_name + v11;
  v14 = v13 - 1024;
  v15 = v13 + 48;
  if (v9) {
    int v16 = mig_strncpy_zerofill(v15, a3, 1024);
  }
  else {
    int v16 = mig_strncpy(v15, a3, 1024);
  }
  *((_DWORD *)v14 + 267) = v16;
  *((_DWORD *)v14 + 266) = 0;
  uint64_t v17 = (v16 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v18 = v12 + v17;
  *(_DWORD *)&v14[v17 + 1072] = a4;
  mach_port_name_t reply_port = mig_get_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v25 = 0x303900000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t reply_port = rcv_name[3];
  }
  uint64_t v20 = mach_msg((mach_msg_header_t *)rcv_name, 3, v18, 0x30u, reply_port, 0, 0);
  uint64_t v21 = v20;
  if ((v20 - 268435458) > 0xE || ((1 << (v20 - 2)) & 0x4003) == 0)
  {
    if (v20)
    {
      mig_dealloc_reply_port(rcv_name[3]);
      return v21;
    }
    if (DWORD1(v25) == 71)
    {
      uint64_t v21 = 4294966988;
    }
    else if (DWORD1(v25) == 12445)
    {
      if ((rcv_name[0] & 0x80000000) == 0)
      {
        if (rcv_name[1] == 40)
        {
          if (!rcv_name[2])
          {
            uint64_t v21 = LODWORD(v26[0]);
            if (!LODWORD(v26[0]))
            {
              *a5 = DWORD1(v26[0]);
              return v21;
            }
            goto LABEL_29;
          }
        }
        else if (rcv_name[1] == 36)
        {
          if (rcv_name[2]) {
            BOOL v22 = 1;
          }
          else {
            BOOL v22 = LODWORD(v26[0]) == 0;
          }
          if (v22) {
            uint64_t v21 = 4294966996;
          }
          else {
            uint64_t v21 = LODWORD(v26[0]);
          }
          goto LABEL_29;
        }
      }
      uint64_t v21 = 4294966996;
    }
    else
    {
      uint64_t v21 = 4294966995;
    }
LABEL_29:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v21;
  }
  mig_put_reply_port(rcv_name[3]);
  return v21;
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x270ED8770](*(void *)&bp, service_name, sp);
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x270ED8790](*(void *)&r);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x270EDA4E8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x270EDA500](dest, src, *(void *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x270EDA508](dest, src, *(void *)&len);
}