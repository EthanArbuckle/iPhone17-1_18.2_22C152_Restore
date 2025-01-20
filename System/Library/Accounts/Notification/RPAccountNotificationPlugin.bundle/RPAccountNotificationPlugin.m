uint64_t LogPrintF()
{
  return MEMORY[0x270F243F8]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x270F24858]();
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_release(id a1)
{
}

 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  id v21;
  id v22;
  id v23;
  uint64_t vars8;

  v23 = a3;
  v9 = a5;
  v10 = a6;
  if (dword_26AFC72C0 <= 10 && (dword_26AFC72C0 != -1 || _LogCategory_Initialize()))
  {
    if ((a4 - 1) > 3) {
      v11 = "?";
    }
    else {
      v11 = off_2650C5C60[a4 - 1];
    }
    v21 = v10;
    v22 = v23;
    v20 = v11;
    LogPrintF();
  }
  if (v23) {
    v12 = v23;
  }
  else {
    v12 = v10;
  }
  v13 = v12;
  v14 = [v13 accountType];
  v15 = [v14 identifier];
  v16 = [v15 isEqualToString:*MEMORY[0x263EFAE58]];

  if (v16)
  {
    v17 = [v10 identifier];
    v18 = [v23 identifier];
    switch(a4)
    {
      case 1:
        v19 = *MEMORY[0x263F25618];
        if (!objc_msgSend(v23, "aa_isAccountClass:", *MEMORY[0x263F25618])) {
          goto LABEL_43;
        }
        if (dword_26AFC72C0 > 30 || dword_26AFC72C0 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_42;
        }
        v20 = (const char *)v23;
        break;
      case 2:
        v19 = *MEMORY[0x263F25618];
        if (objc_msgSend(v10, "aa_isAccountClass:", *MEMORY[0x263F25618])
          && (objc_msgSend(v23, "aa_isAccountClass:", v19) & 1) == 0
          && [v17 isEqual:v18])
        {
          if (dword_26AFC72C0 > 30 || dword_26AFC72C0 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_40;
          }
          v20 = (const char *)v13;
LABEL_20:
          LogPrintF();
LABEL_40:
          objc_msgSend(MEMORY[0x263F62B68], "primaryAccountSignedOut", v20, v21, v22);
          goto LABEL_43;
        }
        if (!objc_msgSend(v23, "aa_isAccountClass:", v19, v20, v21, v22)
          || (objc_msgSend(v10, "aa_isAccountClass:", v19) & 1) != 0
          || ![v17 isEqual:v18])
        {
          goto LABEL_43;
        }
        if (dword_26AFC72C0 > 30 || dword_26AFC72C0 == -1 && !_LogCategory_Initialize())
        {
LABEL_42:
          objc_msgSend(MEMORY[0x263F62B68], "primaryAccountSignedIn", v20);
LABEL_43:
          if ((objc_msgSend(v23, "aa_isAccountClass:", v19, v20) & 1) != 0
            || objc_msgSend(v10, "aa_isAccountClass:", v19))
          {
            if (dword_26AFC72C0 <= 30 && (dword_26AFC72C0 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            notify_post("com.apple.rapport.primaryAccountChanged");
          }

          goto LABEL_51;
        }
        v20 = (const char *)v23;
        break;
      case 3:
        v19 = *MEMORY[0x263F25618];
        if (!objc_msgSend(v13, "aa_isAccountClass:", *MEMORY[0x263F25618])) {
          goto LABEL_43;
        }
        if (dword_26AFC72C0 > 30 || dword_26AFC72C0 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_40;
        }
        v20 = (const char *)v13;
        goto LABEL_20;
      default:
        v19 = *MEMORY[0x263F25618];
        goto LABEL_43;
    }
    LogPrintF();
    goto LABEL_42;
  }
LABEL_51:
}

@end