@interface NSMetaphone
- (NSMetaphone)init;
- (id)_translateWord:(id)a3;
- (id)translate:(id)a3;
- (void)_append:(id)a3;
- (void)_append:(id)a3 alt:(id)a4;
- (void)reset;
@end

@implementation NSMetaphone

- (NSMetaphone)init
{
  v9.receiver = self;
  v9.super_class = (Class)NSMetaphone;
  v2 = [(NSMetaphone *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
    primary = v2->_primary;
    v2->_primary = v3;

    v5 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
    secondary = v2->_secondary;
    v2->_secondary = v5;

    v2->_isAlternate = 0;
    v7 = v2;
  }

  return v2;
}

- (void)reset
{
  v3 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
  primary = self->_primary;
  self->_primary = v3;

  v5 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
  secondary = self->_secondary;
  self->_secondary = v5;

  self->_isAlternate = 0;
}

- (void)_append:(id)a3
{
  primary = self->_primary;
  id v5 = a3;
  [(NSMutableString *)primary appendString:v5];
  [(NSMutableString *)self->_secondary appendString:v5];
}

- (void)_append:(id)a3 alt:(id)a4
{
  primary = self->_primary;
  id v7 = a4;
  [(NSMutableString *)primary appendString:a3];
  [(NSMutableString *)self->_secondary appendString:v7];
}

- (id)_translateWord:(id)a3
{
  id v4 = a3;
  id v5 = +[NSCharacterSet punctuationCharacterSet];
  v6 = [v4 componentsSeparatedByCharactersInSet:v5];
  id v7 = &stru_A2698;
  v8 = [v6 componentsJoinedByString:&stru_A2698];

  objc_super v9 = [v8 uppercaseString];
  v10 = [&stru_A2698 stringByAppendingFormat:@" %@ ", v9];

  unsigned __int16 v83 = (unsigned __int16)[v10 length];
  if (v83)
  {
    id v82 = v4;
    unsigned int v11 = sub_5808(v10, 0, 2, &off_A4258);
    v12 = sub_5940(v10, 0, 1);
    unsigned int v13 = [v12 isEqualToString:@"X"];

    if (v13)
    {
      [(NSMetaphone *)self _append:@"S"];
      if (v11) {
        unsigned int v11 = 2;
      }
      else {
        unsigned int v11 = 1;
      }
    }
    if (v83 > (unsigned __int16)v11)
    {
      int v14 = (unsigned __int16)v11;
      while (2)
      {
        unsigned int v15 = sub_59C0(v10, (unsigned __int16)v11);
        switch(v15)
        {
          case ' ':
            v16 = self;
            CFStringRef v17 = @" ";
            goto LABEL_103;
          case '!':
          case '""':
          case '#':
          case '$':
          case '%':
          case '&':
          case '\'':
          case '(':
          case ')':
          case '*':
          case '+':
          case ',':
          case '-':
          case '.':
          case '/':
          case '0':
          case '1':
          case '2':
          case '3':
          case '4':
          case '5':
          case '6':
          case '7':
          case '8':
          case '9':
          case ':':
          case ';':
          case '<':
          case '=':
          case '>':
          case '?':
          case '@':
            goto LABEL_104;
          case 'A':
          case 'E':
          case 'I':
          case 'O':
          case 'U':
          case 'Y':
            if ((unsigned __int16)v11 != 1) {
              goto LABEL_104;
            }
            v16 = self;
            CFStringRef v17 = @"A";
            goto LABEL_103;
          case 'B':
            [(NSMetaphone *)self _append:@"P"];
            unsigned int v19 = sub_59C0(v10, (unsigned __int16)(v11 + 1));
            int v20 = v11 + 2;
            BOOL v21 = v19 == 66;
            goto LABEL_74;
          case 'C':
            if ((unsigned __int16)v11 < 2u)
            {
              if ((unsigned __int16)v11 == 1)
              {
                int v54 = 1;
                v55 = sub_5940(v10, 1, 6);
                unsigned int v56 = [v55 isEqualToString:@"CAESAR"];

                if (v56)
                {
                  v30 = self;
                  CFStringRef v31 = @"S";
                  goto LABEL_249;
                }
                goto LABEL_159;
              }
            }
            else if ((sub_5808(v10, (__int16)(v11 - 2), 1, &off_A4AE0) & 1) == 0)
            {
              v22 = sub_5940(v10, (__int16)(v11 - 1), 3);
              if ([v22 isEqualToString:@"ACH"])
              {
                int v18 = v11 + 2;
                if (sub_59C0(v10, (unsigned __int16)(v11 + 2)) != 73
                  && sub_59C0(v10, (unsigned __int16)(v11 + 2)) != 69)
                {

LABEL_67:
                  v40 = self;
                  CFStringRef v41 = @"K";
LABEL_236:
                  [(NSMetaphone *)v40 _append:v41];
                  goto LABEL_237;
                }
                unsigned int v23 = sub_5808(v10, (__int16)(v11 - 2), 6, &off_A4270);

                if (v23) {
                  goto LABEL_67;
                }
              }
              else
              {
              }
            }
            int v54 = 0;
LABEL_159:
            v64 = sub_5940(v10, (__int16)v11, 4);
            unsigned int v65 = [v64 isEqualToString:@"CHIA"];

            if (v65) {
              goto LABEL_160;
            }
            v66 = sub_5940(v10, (__int16)v11, 2);
            unsigned int v67 = [v66 isEqualToString:@"CH"];

            if (v67)
            {
              if ((_WORD)v11)
              {
                v68 = sub_5940(v10, (__int16)v11, 4);
                unsigned int v69 = [v68 isEqualToString:@"CHAE"];

                if (v69)
                {
                  v37 = self;
                  CFStringRef v38 = @"K";
LABEL_230:
                  CFStringRef v39 = @"X";
                  goto LABEL_241;
                }
              }
              if (!v54
                || (sub_5808(v10, 2, 5, &off_A4288) & 1) == 0
                && !sub_5808(v10, 2, 3, &off_A42A0)
                || (sub_5940(v10, (__int16)v11, 5),
                    v70 = objc_claimAutoreleasedReturnValue(),
                    unsigned __int8 v71 = [v70 isEqualToString:@"CHORE"],
                    v70,
                    (v71 & 1) != 0))
              {
                if ((sub_5808(v10, 0, 4, &off_A42B8) & 1) == 0
                  && (sub_5808(v10, 0, 3, &off_A42D0) & 1) == 0
                  && (sub_5808(v10, (__int16)(v11 - 2), 6, &off_A42E8) & 1) == 0)
                {
                  int v18 = v11 + 2;
                  if ((sub_5808(v10, (__int16)(v11 + 2), 1, &off_A4300) & 1) == 0
                    && ((v54 | sub_5808(v10, (__int16)(v11 - 1), 1, &off_A4318)) != 1
                     || !sub_5808(v10, (__int16)(v11 + 2), 1, &off_A4330)))
                  {
                    if (!(_WORD)v11)
                    {
                      [(NSMetaphone *)self _append:@"X"];
                      int v18 = 2;
                      goto LABEL_237;
                    }
                    if (sub_5808(v10, 0, 2, &off_A4348)) {
                      goto LABEL_67;
                    }
                    v47 = self;
                    CFStringRef v48 = @"X";
                    CFStringRef v49 = @"K";
                    goto LABEL_267;
                  }
                }
              }
              goto LABEL_160;
            }
            if (sub_5808(v10, (__int16)v11, 2, &off_A4360)
              && (sub_5808(v10, (__int16)(v11 - 2), 4, &off_A4378) & 1) == 0)
            {
LABEL_229:
              v37 = self;
              CFStringRef v38 = @"S";
              goto LABEL_230;
            }
            int v18 = v11 + 1;
            if (sub_5808(v10, (__int16)(v11 + 1), 3, &off_A4390))
            {
LABEL_170:
              v24 = self;
              CFStringRef v25 = @"X";
              goto LABEL_171;
            }
            if (sub_5808(v10, (__int16)v11, 2, &off_A43A8)
              && ((unsigned __int16)v11 != 2 || sub_59C0(v10, 0) != 77))
            {
              int v18 = v11 + 2;
              if (!sub_5808(v10, (__int16)(v11 + 2), 1, &off_A43C0)
                || (sub_5808(v10, (__int16)(v11 + 2), 2, &off_A43D8) & 1) != 0)
              {
                goto LABEL_67;
              }
              if ((unsigned __int16)v11 != 2 || (v79 = sub_59C0(v10, 1u), CFStringRef v25 = @"KS", v79 != 65))
              {
                if (sub_5808(v10, (__int16)(v11 - 1), 5, &off_A43F0)) {
                  CFStringRef v25 = @"KS";
                }
                else {
                  CFStringRef v25 = @"X";
                }
              }
              v24 = self;
LABEL_171:
              [(NSMetaphone *)v24 _append:v25];
              goto LABEL_172;
            }
            if (sub_5808(v10, (__int16)v11, 2, &off_A4408)) {
              goto LABEL_160;
            }
            if (!sub_5808(v10, (__int16)v11, 2, &off_A4420))
            {
              [(NSMetaphone *)self _append:@"K"];
              if (!sub_5808(v10, (__int16)(v11 + 1), 2, &off_A4450))
              {
                if (sub_5808(v10, (__int16)(v11 + 1), 1, &off_A4468)
                  && !sub_5808(v10, (__int16)(v11 + 1), 2, &off_A4480))
                {
                  int v18 = v11 + 2;
                }
                goto LABEL_237;
              }
LABEL_172:
              int v18 = v11 + 3;
              goto LABEL_237;
            }
            if (sub_5808(v10, (__int16)v11, 3, &off_A4438)) {
              goto LABEL_229;
            }
            v32 = self;
            CFStringRef v33 = @"S";
LABEL_161:
            [(NSMetaphone *)v32 _append:v33];
            goto LABEL_162;
          case 'D':
            if (!sub_5808(v10, (__int16)v11, 2, &off_A4498))
            {
              unsigned int v57 = sub_5808(v10, (__int16)v11, 2, &off_A44C8);
              [(NSMetaphone *)self _append:@"T"];
              int v52 = v11 + 2;
              BOOL v53 = v57 == 0;
LABEL_109:
              if (v53) {
                int v18 = v11 + 1;
              }
              else {
                int v18 = v52;
              }
              goto LABEL_237;
            }
            int v18 = v11 + 2;
            if (sub_5808(v10, (__int16)(v11 + 2), 1, &off_A44B0))
            {
              v24 = self;
              CFStringRef v25 = @"J";
              goto LABEL_171;
            }
            v40 = self;
            CFStringRef v41 = @"TK";
            goto LABEL_236;
          case 'F':
            unsigned int v26 = sub_59C0(v10, (unsigned __int16)(v11 + 1));
            int v27 = v11 + 2;
            BOOL v28 = v26 == 70;
            goto LABEL_89;
          case 'G':
            __int16 v29 = v11 + 1;
            if (sub_59C0(v10, (unsigned __int16)(v11 + 1)) != 72)
            {
              if (sub_59C0(v10, (unsigned __int16)(v11 + 1)) == 78)
              {
                if ((unsigned __int16)v11 == 1 && sub_5808(v10, 0, 1, &off_A4AE0) && !sub_5A14(v10))
                {
                  v60 = self;
                  CFStringRef v61 = @"KN";
                  CFStringRef v62 = @"N";
LABEL_252:
                  [(NSMetaphone *)v60 _append:v61 alt:v62];
LABEL_253:
                  int v18 = 3;
                  goto LABEL_237;
                }
                int v18 = v11 + 2;
                if ((sub_5808(v10, (__int16)(v11 + 2), 2, &off_A4540) & 1) != 0
                  || sub_59C0(v10, (unsigned __int16)(v11 + 1)) == 89
                  || sub_5A14(v10))
                {
                  v40 = self;
                  CFStringRef v41 = @"KN";
                  goto LABEL_236;
                }
                v47 = self;
                CFStringRef v48 = @"N";
                CFStringRef v49 = @"KN";
LABEL_267:
                [(NSMetaphone *)v47 _append:v48 alt:v49];
                goto LABEL_237;
              }
              if (sub_5808(v10, v29, 2, &off_A4558) && !sub_5A14(v10))
              {
                v37 = self;
                CFStringRef v38 = @"KL";
                CFStringRef v39 = @"L";
                goto LABEL_241;
              }
              if ((unsigned __int16)v11 == 1
                && (sub_59C0(v10, (unsigned __int16)(v11 + 1)) == 89
                 || sub_5808(v10, v29, 2, &off_A4570)))
              {
                v60 = self;
                CFStringRef v61 = @"K";
                CFStringRef v62 = @"J";
                goto LABEL_252;
              }
              if (((sub_5808(v10, v29, 2, &off_A4588) & 1) != 0
                 || sub_59C0(v10, (unsigned __int16)(v11 + 1)) == 89)
                && (sub_5808(v10, 0, 6, &off_A45A0) & 1) == 0
                && (sub_5808(v10, (__int16)(v11 - 1), 1, &off_A45B8) & 1) == 0
                && (sub_5808(v10, (__int16)(v11 - 1), 3, &off_A45D0) & 1) == 0)
              {
                v37 = self;
                CFStringRef v38 = @"K";
                CFStringRef v39 = @"J";
LABEL_241:
                [(NSMetaphone *)v37 _append:v38 alt:v39];
                goto LABEL_162;
              }
              if ((sub_5808(v10, v29, 1, &off_A45E8) & 1) == 0
                && !sub_5808(v10, (__int16)(v11 - 1), 4, &off_A4600))
              {
                if (sub_59C0(v10, (unsigned __int16)(v11 + 1)) == 71) {
                  int v18 = v11 + 2;
                }
                else {
                  int v18 = v11 + 1;
                }
                goto LABEL_67;
              }
              if ((sub_5808(v10, 0, 4, &off_A4618) & 1) == 0
                && (sub_5808(v10, 0, 3, &off_A4630) & 1) == 0
                && !sub_5808(v10, v29, 2, &off_A4648))
              {
                if (sub_5808(v10, v29, 4, &off_A4660))
                {
LABEL_101:
                  v32 = self;
                  CFStringRef v33 = @"J";
                  goto LABEL_161;
                }
                v37 = self;
                CFStringRef v38 = @"J";
                CFStringRef v39 = @"K";
                goto LABEL_241;
              }
LABEL_160:
              v32 = self;
              CFStringRef v33 = @"K";
              goto LABEL_161;
            }
            if (!(_WORD)v11) {
              goto LABEL_162;
            }
            if ((sub_5808(v10, (__int16)(v11 - 1), 1, &off_A4AE0) & 1) == 0) {
              goto LABEL_160;
            }
            if ((unsigned __int16)v11 == 1)
            {
              if (sub_59C0(v10, 3u) == 73)
              {
                v30 = self;
                CFStringRef v31 = @"J";
              }
              else
              {
                v30 = self;
                CFStringRef v31 = @"K";
              }
LABEL_249:
              [(NSMetaphone *)v30 _append:v31];
              goto LABEL_253;
            }
            if (sub_5808(v10, (__int16)(v11 - 2), 1, &off_A44E0)) {
              goto LABEL_162;
            }
            if ((unsigned __int16)v11 < 3u)
            {
LABEL_218:
              unsigned int v73 = sub_59C0(v10, (unsigned __int16)(v11 - 1));
              CFStringRef v33 = @"K";
              if (v73 != 73) {
                goto LABEL_139;
              }
              goto LABEL_162;
            }
            if ((sub_5808(v10, (__int16)(v11 - 3), 1, &off_A44F8) & 1) == 0
              && ((unsigned __int16)v11 < 4u || !sub_5808(v10, (__int16)(v11 - 4), 1, &off_A4510)))
            {
              if (sub_59C0(v10, (unsigned __int16)(v11 - 1)) != 85) {
                goto LABEL_218;
              }
              unsigned __int8 v72 = sub_5808(v10, (__int16)(v11 - 3), 1, &off_A4528);
              CFStringRef v33 = @"F";
              if ((v72 & 1) == 0) {
                goto LABEL_218;
              }
LABEL_139:
              v32 = self;
              goto LABEL_161;
            }
LABEL_162:
            int v18 = v11 + 2;
LABEL_237:
            int v14 = (unsigned __int16)v18;
            unsigned int v11 = v18;
            if (v83 <= (unsigned __int16)v18) {
              break;
            }
            continue;
          case 'H':
            if ((unsigned __int16)v11 != 1
              && (sub_5808(v10, (__int16)(v11 - 1), 1, &off_A4AE0) & 1) == 0)
            {
              goto LABEL_104;
            }
            int v18 = v11 + 1;
            if (!sub_5808(v10, (__int16)(v11 + 1), 1, &off_A4AE0)) {
              goto LABEL_237;
            }
            v32 = self;
            CFStringRef v33 = @"H";
            goto LABEL_161;
          case 'J':
            if ((sub_5808(v10, (__int16)v11, 4, &off_A4678) & 1) == 0
              && !sub_5808(v10, 0, 4, &off_A4690))
            {
              if (unsigned __int16)v11 != 1 || (sub_5808(v10, 1, 4, &off_A46C0))
              {
                if (sub_5808(v10, (__int16)(v11 - 1), 1, &off_A4AE0)
                  && !sub_5A14(v10)
                  && (sub_59C0(v10, (unsigned __int16)(v11 + 1)) == 65
                   || sub_59C0(v10, (unsigned __int16)(v11 + 1)) == 79))
                {
                  v58 = self;
                  CFStringRef v59 = @"H";
LABEL_245:
                  [(NSMetaphone *)v58 _append:@"J" alt:v59];
                }
                else
                {
                  if (v83 == v14)
                  {
                    v58 = self;
                    CFStringRef v59 = @" ";
                    goto LABEL_245;
                  }
                  if ((sub_5808(v10, (__int16)(v11 + 1), 1, &off_A46D8) & 1) == 0
                    && (sub_5808(v10, (__int16)(v11 - 1), 1, &off_A46F0) & 1) == 0)
                  {
                    [(NSMetaphone *)self _append:@"J"];
                  }
                }
                unsigned int v74 = sub_59C0(v10, (unsigned __int16)(v11 + 1));
                int v20 = v11 + 2;
                BOOL v21 = v74 == 74;
LABEL_74:
                if (v21) {
                  int v18 = v20;
                }
                else {
                  int v18 = v11 + 1;
                }
                goto LABEL_237;
              }
              v58 = self;
              CFStringRef v59 = @"A";
              goto LABEL_245;
            }
            if ((unsigned __int16)v11 == 1 && sub_59C0(v10, 5u) == 32
              || sub_5808(v10, 0, 4, &off_A46A8))
            {
              v16 = self;
              CFStringRef v17 = @"H";
              goto LABEL_103;
            }
            v44 = self;
            CFStringRef v45 = @"J";
            CFStringRef v46 = @"H";
LABEL_208:
            [(NSMetaphone *)v44 _append:v45 alt:v46];
LABEL_104:
            int v18 = v11 + 1;
            goto LABEL_237;
          case 'K':
            unsigned int v34 = sub_59C0(v10, (unsigned __int16)(v11 + 1));
            int v35 = v11 + 2;
            BOOL v36 = v34 == 75;
            goto LABEL_64;
          case 'L':
            int v18 = v11 + 1;
            if (sub_59C0(v10, (unsigned __int16)(v11 + 1)) != 76) {
              goto LABEL_156;
            }
            if (v83 - 3 == v14 && (sub_5808(v10, (__int16)(v11 - 1), 4, &off_A4708) & 1) != 0
              || (sub_5808(v10, (__int16)(v83 - 1), 2, &off_A4720) & 1) != 0
              || sub_5808(v10, (__int16)v83, 1, &off_A4738)
              && sub_5808(v10, (__int16)(v11 - 1), 4, &off_A4750))
            {
              v37 = self;
              CFStringRef v38 = @"L";
              CFStringRef v39 = @" ";
              goto LABEL_241;
            }
            int v18 = v11 + 2;
LABEL_156:
            v40 = self;
            CFStringRef v41 = @"L";
            goto LABEL_236;
          case 'M':
            if (sub_5808(v10, (__int16)(v11 - 1), 3, &off_A4768)
              && (v14 + 1 == v83 || (sub_5808(v10, (__int16)(v11 + 2), 2, &off_A4780) & 1) != 0)
              || (int v18 = v11 + 1, sub_59C0(v10, (unsigned __int16)(v11 + 1)) == 77))
            {
              int v18 = v11 + 2;
            }
            v40 = self;
            CFStringRef v41 = @"M";
            goto LABEL_236;
          case 'N':
            if (sub_59C0(v10, (unsigned __int16)(v11 + 1)) == 78) {
              int v18 = v11 + 2;
            }
            else {
              int v18 = v11 + 1;
            }
            goto LABEL_58;
          case 'P':
            int v18 = v11 + 2;
            if (sub_59C0(v10, (unsigned __int16)(v11 + 1)) == 72) {
              goto LABEL_92;
            }
            if (!sub_5808(v10, (__int16)(v11 + 1), 1, &off_A4798)) {
              int v18 = v11 + 1;
            }
            v40 = self;
            CFStringRef v41 = @"P";
            goto LABEL_236;
          case 'Q':
            unsigned int v42 = sub_59C0(v10, (unsigned __int16)(v11 + 1));
            int v35 = v11 + 2;
            BOOL v36 = v42 == 81;
LABEL_64:
            if (v36) {
              int v18 = v35;
            }
            else {
              int v18 = v11 + 1;
            }
            goto LABEL_67;
          case 'R':
            if (v83 == v14
              && !sub_5A14(v10)
              && sub_5808(v10, (__int16)(v11 - 2), 2, &off_A47B0)
              && (sub_5808(v10, (__int16)(v11 - 4), 2, &off_A47C8) & 1) == 0)
            {
              [(NSMetaphone *)self _append:&stru_A2698 alt:@"R"];
            }
            else
            {
              [(NSMetaphone *)self _append:@"R"];
            }
            unsigned int v43 = sub_59C0(v10, (unsigned __int16)(v11 + 1));
            int v20 = v11 + 2;
            BOOL v21 = v43 == 82;
            goto LABEL_74;
          case 'S':
            if (sub_5808(v10, (__int16)(v11 - 1), 3, &off_A47E0)) {
              goto LABEL_104;
            }
            if (sub_5808(v10, (__int16)v11, 5, &off_A47F8))
            {
              v44 = self;
              CFStringRef v45 = @"X";
              CFStringRef v46 = @"S";
              goto LABEL_208;
            }
            if (!sub_5808(v10, (__int16)v11, 2, &off_A4810))
            {
              if ((sub_5808(v10, (__int16)v11, 3, &off_A4840) & 1) == 0
                && !sub_5808(v10, (__int16)v11, 4, &off_A4858))
              {
                if ((unsigned __int16)v11 == 1
                  && (int v75 = 2, (sub_5808(v10, 2, 1, &off_A4870) & 1) != 0)
                  || (int v75 = v11 + 1, sub_5808(v10, (__int16)(v11 + 1), 1, &off_A4888)))
                {
                  [(NSMetaphone *)self _append:@"S" alt:@"X"];
                  int v76 = (__int16)v75;
                  v77 = v10;
                  v78 = &off_A48A0;
LABEL_287:
                  if (sub_5808(v77, v76, 1, v78)) {
                    int v18 = v11 + 2;
                  }
                  else {
                    int v18 = v75;
                  }
                  goto LABEL_237;
                }
                if (!sub_5808(v10, (__int16)v11, 2, &off_A48B8))
                {
                  if (v83 == v14 && sub_5808(v10, (__int16)(v11 - 2), 2, &off_A4918)) {
                    [(NSMetaphone *)self _append:&stru_A2698 alt:@"S"];
                  }
                  else {
                    [(NSMetaphone *)self _append:@"S"];
                  }
                  v77 = v10;
                  int v76 = (__int16)(v11 + 1);
                  v78 = &off_A4930;
                  goto LABEL_287;
                }
                if (sub_59C0(v10, (unsigned __int16)(v11 + 2)) != 72)
                {
                  int v18 = v11 + 3;
                  if (sub_5808(v10, (__int16)(v11 + 2), 1, &off_A4900))
                  {
                    v40 = self;
                    CFStringRef v41 = @"S";
                    goto LABEL_236;
                  }
                  goto LABEL_292;
                }
                int v18 = v11 + 3;
                if (sub_5808(v10, (__int16)(v11 + 3), 2, &off_A48D0))
                {
                  if (sub_5808(v10, (__int16)(v11 + 3), 2, &off_A48E8))
                  {
                    v47 = self;
                    CFStringRef v48 = @"X";
                    CFStringRef v49 = @"SK";
                    goto LABEL_267;
                  }
LABEL_292:
                  v40 = self;
                  CFStringRef v41 = @"SK";
                  goto LABEL_236;
                }
                if ((unsigned __int16)v11 == 1
                  && (sub_5808(v10, 3, 1, &off_A4AE0) & 1) == 0
                  && sub_59C0(v10, 3u) != 87)
                {
                  [(NSMetaphone *)self _append:@"X" alt:@"S"];
                  int v18 = 4;
                  goto LABEL_237;
                }
                v40 = self;
                CFStringRef v41 = @"X";
                goto LABEL_236;
              }
              if (sub_5A14(v10))
              {
                v24 = self;
                CFStringRef v25 = @"S";
                goto LABEL_171;
              }
              [(NSMetaphone *)self _append:@"S" alt:@"X"];
              goto LABEL_172;
            }
            if (sub_5808(v10, (__int16)(v11 + 1), 4, &off_A4828)) {
              CFStringRef v33 = @"S";
            }
            else {
              CFStringRef v33 = @"X";
            }
            goto LABEL_139;
          case 'T':
            if (sub_5808(v10, (__int16)v11, 4, &off_A4948)
              || sub_5808(v10, (__int16)v11, 3, &off_A4960))
            {
              goto LABEL_170;
            }
            if ((sub_5808(v10, (__int16)v11, 2, &off_A4978) & 1) != 0
              || sub_5808(v10, (__int16)v11, 3, &off_A4990))
            {
              int v18 = v11 + 2;
              if ((sub_5808(v10, (__int16)(v11 + 2), 2, &off_A49A8) & 1) == 0
                && (sub_5808(v10, 0, 4, &off_A49C0) & 1) == 0
                && !sub_5808(v10, 0, 3, &off_A49D8))
              {
                v47 = self;
                CFStringRef v48 = @"0";
                CFStringRef v49 = @"T";
                goto LABEL_267;
              }
            }
            else if (sub_5808(v10, (__int16)(v11 + 1), 1, &off_A49F0))
            {
              int v18 = v11 + 2;
            }
            else
            {
              int v18 = v11 + 1;
            }
            v40 = self;
            CFStringRef v41 = @"T";
            goto LABEL_236;
          case 'V':
            unsigned int v50 = sub_59C0(v10, (unsigned __int16)(v11 + 1));
            int v27 = v11 + 2;
            BOOL v28 = v50 == 86;
LABEL_89:
            if (v28) {
              int v18 = v27;
            }
            else {
              int v18 = v11 + 1;
            }
LABEL_92:
            v40 = self;
            CFStringRef v41 = @"F";
            goto LABEL_236;
          case 'W':
            if (sub_5808(v10, (__int16)v11, 2, &off_A4A08))
            {
              v32 = self;
              CFStringRef v33 = @"R";
              goto LABEL_161;
            }
            if ((unsigned __int16)v11 == 1
              && ((sub_5808(v10, 2, 1, &off_A4AE0) & 1) != 0
               || sub_5808(v10, 1, 2, &off_A4A20)))
            {
              if (sub_5808(v10, 2, 1, &off_A4AE0)) {
                [(NSMetaphone *)self _append:@"A" alt:@"F"];
              }
              else {
                [(NSMetaphone *)self _append:@"A"];
              }
            }
            if (v83 == v14 && (sub_5808(v10, (__int16)(v11 - 1), 1, &off_A4AE0) & 1) != 0
              || (sub_5808(v10, (__int16)(v11 - 1), 5, &off_A4A38) & 1) != 0
              || sub_5808(v10, 0, 3, &off_A4A50))
            {
              v44 = self;
              CFStringRef v45 = &stru_A2698;
              CFStringRef v46 = @"F";
              goto LABEL_208;
            }
            if (!sub_5808(v10, (__int16)v11, 4, &off_A4A68)) {
              goto LABEL_104;
            }
            [(NSMetaphone *)self _append:@"TS" alt:@"FX"];
            int v18 = v11 + 4;
            goto LABEL_237;
          case 'X':
            if (v83 != v14
              || (sub_5808(v10, (__int16)(v11 - 3), 3, &off_A4A80) & 1) == 0
              && (sub_5808(v10, (__int16)(v11 - 2), 2, &off_A4A98) & 1) == 0)
            {
              [(NSMetaphone *)self _append:@"KS"];
            }
            unsigned int v51 = sub_5808(v10, (__int16)(v11 + 1), 1, &off_A4AB0);
            int v52 = v11 + 2;
            BOOL v53 = v51 == 0;
            goto LABEL_109;
          case 'Z':
            if (sub_59C0(v10, (unsigned __int16)(v11 + 1)) == 72) {
              goto LABEL_101;
            }
            if ((sub_5808(v10, (__int16)(v11 + 1), 2, &off_A4AC8) & 1) != 0
              || (BOOL v63 = sub_5A14(v10), (_WORD)v11)
              && v63
              && sub_59C0(v10, (unsigned __int16)(v11 - 1)) != 84)
            {
              [(NSMetaphone *)self _append:@"S" alt:@"TS"];
            }
            else
            {
              [(NSMetaphone *)self _append:@"S"];
            }
            if (sub_59C0(v10, (unsigned __int16)(v11 + 1)) == 90) {
              int v18 = v11 + 2;
            }
            else {
              int v18 = v11 + 1;
            }
            goto LABEL_237;
          default:
            if (v15 == 199)
            {
              v16 = self;
              CFStringRef v17 = @"S";
LABEL_103:
              [(NSMetaphone *)v16 _append:v17];
              goto LABEL_104;
            }
            if (v15 != 209) {
              goto LABEL_104;
            }
            int v18 = v11 + 1;
LABEL_58:
            v40 = self;
            CFStringRef v41 = @"N";
            goto LABEL_236;
        }
        break;
      }
    }
    uint64_t v80 = 16;
    if (!self->_isAlternate) {
      uint64_t v80 = 8;
    }
    id v7 = (__CFString *)*(id *)((char *)&self->super.isa + v80);
    [(NSMetaphone *)self reset];
    id v4 = v82;
  }

  return v7;
}

- (id)translate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableString);
  id v6 = [v4 length];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_5B88;
  v10[3] = &unk_9F2F8;
  id v7 = v5;
  id v11 = v7;
  v12 = self;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 3, v10);

  id v8 = v7;
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondary, 0);

  objc_storeStrong((id *)&self->_primary, 0);
}

@end