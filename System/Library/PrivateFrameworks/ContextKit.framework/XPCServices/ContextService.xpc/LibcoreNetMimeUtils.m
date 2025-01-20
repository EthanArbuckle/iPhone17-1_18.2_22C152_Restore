@interface LibcoreNetMimeUtils
+ (BOOL)hasExtensionWithNSString:(id)a3;
+ (BOOL)hasMimeTypeWithNSString:(id)a3;
+ (JavaIoFileInputStream)applyOverrides;
+ (JavaIoFileInputStream)getContentTypesPropertiesStream;
+ (const)__metadata;
+ (id)guessExtensionFromMimeTypeWithNSString:(id)a3;
+ (id)guessMimeTypeFromExtensionWithNSString:(id)a3;
+ (void)addWithNSString:(id)a3 withNSString:(id)a4;
+ (void)initialize;
@end

@implementation LibcoreNetMimeUtils

+ (void)addWithNSString:(id)a3 withNSString:(id)a4
{
}

+ (BOOL)hasMimeTypeWithNSString:(id)a3
{
  return LibcoreNetMimeUtils_hasMimeTypeWithNSString_(a3);
}

+ (id)guessMimeTypeFromExtensionWithNSString:(id)a3
{
  return LibcoreNetMimeUtils_guessMimeTypeFromExtensionWithNSString_(a3);
}

+ (BOOL)hasExtensionWithNSString:(id)a3
{
  return LibcoreNetMimeUtils_hasExtensionWithNSString_(a3);
}

+ (id)guessExtensionFromMimeTypeWithNSString:(id)a3
{
  return LibcoreNetMimeUtils_guessExtensionFromMimeTypeWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_JavaUtilHashMap_init();
    JreStrongAssignAndConsume((id *)&qword_100560A28, v2);
    v3 = new_JavaUtilHashMap_init();
    JreStrongAssignAndConsume((id *)&qword_100560A30, v3);
    sub_100191B28(@"application/andrew-inset", @"ez");
    sub_100191B28(@"application/dsptype", @"tsp");
    sub_100191B28(@"application/futuresplash", @"spl");
    sub_100191B28(@"application/hta", @"hta");
    sub_100191B28(@"application/mac-binhex40", @"hqx");
    sub_100191B28(@"application/mac-compactpro", @"cpt");
    sub_100191B28(@"application/mathematica", @"nb");
    sub_100191B28(@"application/msaccess", @"mdb");
    sub_100191B28(@"application/oda", @"oda");
    sub_100191B28(@"application/ogg", @"ogg");
    sub_100191B28(@"application/ogg", @"oga");
    sub_100191B28(@"application/pdf", @"pdf");
    sub_100191B28(@"application/pgp-keys", @"key");
    sub_100191B28(@"application/pgp-signature", @"pgp");
    sub_100191B28(@"application/pics-rules", @"prf");
    sub_100191B28(@"application/pkix-cert", @"cer");
    sub_100191B28(@"application/rar", @"rar");
    sub_100191B28(@"application/rdf+xml", @"rdf");
    sub_100191B28(@"application/rss+xml", @"rss");
    sub_100191B28(@"application/zip", @"zip");
    sub_100191B28(@"application/vnd.android.package-archive", @"apk");
    sub_100191B28(@"application/vnd.cinderella", @"cdy");
    sub_100191B28(@"application/vnd.ms-pki.stl", @"stl");
    sub_100191B28(@"application/vnd.oasis.opendocument.database", @"odb");
    sub_100191B28(@"application/vnd.oasis.opendocument.formula", @"odf");
    sub_100191B28(@"application/vnd.oasis.opendocument.graphics", @"odg");
    sub_100191B28(@"application/vnd.oasis.opendocument.graphics-template", @"otg");
    sub_100191B28(@"application/vnd.oasis.opendocument.image", @"odi");
    sub_100191B28(@"application/vnd.oasis.opendocument.spreadsheet", @"ods");
    sub_100191B28(@"application/vnd.oasis.opendocument.spreadsheet-template", @"ots");
    sub_100191B28(@"application/vnd.oasis.opendocument.text", @"odt");
    sub_100191B28(@"application/vnd.oasis.opendocument.text-master", @"odm");
    sub_100191B28(@"application/vnd.oasis.opendocument.text-template", @"ott");
    sub_100191B28(@"application/vnd.oasis.opendocument.text-web", @"oth");
    sub_100191B28(@"application/vnd.google-earth.kml+xml", @"kml");
    sub_100191B28(@"application/vnd.google-earth.kmz", @"kmz");
    sub_100191B28(@"application/msword", @"doc");
    sub_100191B28(@"application/msword", @"dot");
    sub_100191B28(@"application/vnd.openxmlformats-officedocument.wordprocessingml.document", @"docx");
    sub_100191B28(@"application/vnd.openxmlformats-officedocument.wordprocessingml.template", @"dotx");
    sub_100191B28(@"application/vnd.ms-excel", @"xls");
    sub_100191B28(@"application/vnd.ms-excel", @"xlt");
    sub_100191B28(@"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", @"xlsx");
    sub_100191B28(@"application/vnd.openxmlformats-officedocument.spreadsheetml.template", @"xltx");
    sub_100191B28(@"application/vnd.ms-powerpoint", @"ppt");
    sub_100191B28(@"application/vnd.ms-powerpoint", @"pot");
    sub_100191B28(@"application/vnd.ms-powerpoint", @"pps");
    sub_100191B28(@"application/vnd.openxmlformats-officedocument.presentationml.presentation", @"pptx");
    sub_100191B28(@"application/vnd.openxmlformats-officedocument.presentationml.template", @"potx");
    sub_100191B28(@"application/vnd.openxmlformats-officedocument.presentationml.slideshow", @"ppsx");
    sub_100191B28(@"application/vnd.rim.cod", @"cod");
    sub_100191B28(@"application/vnd.smaf", @"mmf");
    sub_100191B28(@"application/vnd.stardivision.calc", @"sdc");
    sub_100191B28(@"application/vnd.stardivision.draw", @"sda");
    sub_100191B28(@"application/vnd.stardivision.impress", @"sdd");
    sub_100191B28(@"application/vnd.stardivision.impress", @"sdp");
    sub_100191B28(@"application/vnd.stardivision.math", @"smf");
    sub_100191B28(@"application/vnd.stardivision.writer", @"sdw");
    sub_100191B28(@"application/vnd.stardivision.writer", @"vor");
    sub_100191B28(@"application/vnd.stardivision.writer-global", @"sgl");
    sub_100191B28(@"application/vnd.sun.xml.calc", @"sxc");
    sub_100191B28(@"application/vnd.sun.xml.calc.template", @"stc");
    sub_100191B28(@"application/vnd.sun.xml.draw", @"sxd");
    sub_100191B28(@"application/vnd.sun.xml.draw.template", @"std");
    sub_100191B28(@"application/vnd.sun.xml.impress", @"sxi");
    sub_100191B28(@"application/vnd.sun.xml.impress.template", @"sti");
    sub_100191B28(@"application/vnd.sun.xml.math", @"sxm");
    sub_100191B28(@"application/vnd.sun.xml.writer", @"sxw");
    sub_100191B28(@"application/vnd.sun.xml.writer.global", @"sxg");
    sub_100191B28(@"application/vnd.sun.xml.writer.template", @"stw");
    sub_100191B28(@"application/vnd.visio", @"vsd");
    sub_100191B28(@"application/x-abiword", @"abw");
    sub_100191B28(@"application/x-apple-diskimage", @"dmg");
    sub_100191B28(@"application/x-bcpio", @"bcpio");
    sub_100191B28(@"application/x-bittorrent", @"torrent");
    sub_100191B28(@"application/x-cdf", @"cdf");
    sub_100191B28(@"application/x-cdlink", @"vcd");
    sub_100191B28(@"application/x-chess-pgn", @"pgn");
    sub_100191B28(@"application/x-cpio", @"cpio");
    sub_100191B28(@"application/x-debian-package", @"deb");
    sub_100191B28(@"application/x-debian-package", @"udeb");
    sub_100191B28(@"application/x-director", @"dcr");
    sub_100191B28(@"application/x-director", @"dir");
    sub_100191B28(@"application/x-director", @"dxr");
    sub_100191B28(@"application/x-dms", @"dms");
    sub_100191B28(@"application/x-doom", @"wad");
    sub_100191B28(@"application/x-dvi", @"dvi");
    sub_100191B28(@"application/x-flac", @"flac");
    sub_100191B28(@"application/x-font", @"pfa");
    sub_100191B28(@"application/x-font", @"pfb");
    sub_100191B28(@"application/x-font", @"gsf");
    sub_100191B28(@"application/x-font", @"pcf");
    sub_100191B28(@"application/x-font", @"pcf.Z");
    sub_100191B28(@"application/x-freemind", @"mm");
    sub_100191B28(@"application/x-futuresplash", @"spl");
    sub_100191B28(@"application/x-gnumeric", @"gnumeric");
    sub_100191B28(@"application/x-go-sgf", @"sgf");
    sub_100191B28(@"application/x-graphing-calculator", @"gcf");
    sub_100191B28(@"application/x-gtar", @"tgz");
    sub_100191B28(@"application/x-gtar", @"gtar");
    sub_100191B28(@"application/x-gtar", @"taz");
    sub_100191B28(@"application/x-hdf", @"hdf");
    sub_100191B28(@"application/x-ica", @"ica");
    sub_100191B28(@"application/x-internet-signup", @"ins");
    sub_100191B28(@"application/x-internet-signup", @"isp");
    sub_100191B28(@"application/x-iphone", @"iii");
    sub_100191B28(@"application/x-iso9660-image", @"iso");
    sub_100191B28(@"application/x-jmol", @"jmz");
    sub_100191B28(@"application/x-kchart", @"chrt");
    sub_100191B28(@"application/x-killustrator", @"kil");
    sub_100191B28(@"application/x-koan", @"skp");
    sub_100191B28(@"application/x-koan", @"skd");
    sub_100191B28(@"application/x-koan", @"skt");
    sub_100191B28(@"application/x-koan", @"skm");
    sub_100191B28(@"application/x-kpresenter", @"kpr");
    sub_100191B28(@"application/x-kpresenter", @"kpt");
    sub_100191B28(@"application/x-kspread", @"ksp");
    sub_100191B28(@"application/x-kword", @"kwd");
    sub_100191B28(@"application/x-kword", @"kwt");
    sub_100191B28(@"application/x-latex", @"latex");
    sub_100191B28(@"application/x-lha", @"lha");
    sub_100191B28(@"application/x-lzh", @"lzh");
    sub_100191B28(@"application/x-lzx", @"lzx");
    sub_100191B28(@"application/x-maker", @"frm");
    sub_100191B28(@"application/x-maker", @"maker");
    sub_100191B28(@"application/x-maker", @"frame");
    sub_100191B28(@"application/x-maker", @"fb");
    sub_100191B28(@"application/x-maker", @"book");
    sub_100191B28(@"application/x-maker", @"fbdoc");
    sub_100191B28(@"application/x-mif", @"mif");
    sub_100191B28(@"application/x-ms-wmd", @"wmd");
    sub_100191B28(@"application/x-ms-wmz", @"wmz");
    sub_100191B28(@"application/x-msi", @"msi");
    sub_100191B28(@"application/x-ns-proxy-autoconfig", @"pac");
    sub_100191B28(@"application/x-nwc", @"nwc");
    sub_100191B28(@"application/x-object", @"o");
    sub_100191B28(@"application/x-oz-application", @"oza");
    sub_100191B28(@"application/x-pem-file", @"pem");
    sub_100191B28(@"application/x-pkcs12", @"p12");
    sub_100191B28(@"application/x-pkcs12", @"pfx");
    sub_100191B28(@"application/x-pkcs7-certreqresp", @"p7r");
    sub_100191B28(@"application/x-pkcs7-crl", @"crl");
    sub_100191B28(@"application/x-quicktimeplayer", @"qtl");
    sub_100191B28(@"application/x-shar", @"shar");
    sub_100191B28(@"application/x-shockwave-flash", @"swf");
    sub_100191B28(@"application/x-stuffit", @"sit");
    sub_100191B28(@"application/x-sv4cpio", @"sv4cpio");
    sub_100191B28(@"application/x-sv4crc", @"sv4crc");
    sub_100191B28(@"application/x-tar", @"tar");
    sub_100191B28(@"application/x-texinfo", @"texinfo");
    sub_100191B28(@"application/x-texinfo", @"texi");
    sub_100191B28(@"application/x-troff", @"t");
    sub_100191B28(@"application/x-troff", @"roff");
    sub_100191B28(@"application/x-troff-man", @"man");
    sub_100191B28(@"application/x-ustar", @"ustar");
    sub_100191B28(@"application/x-wais-source", @"src");
    sub_100191B28(@"application/x-wingz", @"wz");
    sub_100191B28(@"application/x-webarchive", @"webarchive");
    sub_100191B28(@"application/x-webarchive-xml", @"webarchivexml");
    sub_100191B28(@"application/x-x509-ca-cert", @"crt");
    sub_100191B28(@"application/x-x509-user-cert", @"crt");
    sub_100191B28(@"application/x-x509-server-cert", @"crt");
    sub_100191B28(@"application/x-xcf", @"xcf");
    sub_100191B28(@"application/x-xfig", @"fig");
    sub_100191B28(@"application/xhtml+xml", @"xhtml");
    sub_100191B28(@"audio/3gpp", @"3gpp");
    sub_100191B28(@"audio/aac", @"aac");
    sub_100191B28(@"audio/aac-adts", @"aac");
    sub_100191B28(@"audio/amr", @"amr");
    sub_100191B28(@"audio/amr-wb", @"awb");
    sub_100191B28(@"audio/basic", @"snd");
    sub_100191B28(@"audio/imelody", @"imy");
    sub_100191B28(@"audio/midi", @"mid");
    sub_100191B28(@"audio/midi", @"midi");
    sub_100191B28(@"audio/midi", @"ota");
    sub_100191B28(@"audio/midi", @"kar");
    sub_100191B28(@"audio/midi", @"rtttl");
    sub_100191B28(@"audio/midi", @"xmf");
    sub_100191B28(@"audio/mobile-xmf", @"mxmf");
    sub_100191B28(@"audio/mpeg", @"mp3");
    sub_100191B28(@"audio/mpeg", @"mpga");
    sub_100191B28(@"audio/mpeg", @"mpega");
    sub_100191B28(@"audio/mpeg", @"mp2");
    sub_100191B28(@"audio/mpeg", @"m4a");
    sub_100191B28(@"audio/mpegurl", @"m3u");
    sub_100191B28(@"audio/prs.sid", @"sid");
    sub_100191B28(@"audio/x-aiff", @"aif");
    sub_100191B28(@"audio/x-aiff", @"aiff");
    sub_100191B28(@"audio/x-aiff", @"aifc");
    sub_100191B28(@"audio/x-gsm", @"gsm");
    sub_100191B28(@"audio/x-matroska", @"mka");
    sub_100191B28(@"audio/x-mpegurl", @"m3u");
    sub_100191B28(@"audio/x-ms-wma", @"wma");
    sub_100191B28(@"audio/x-ms-wax", @"wax");
    sub_100191B28(@"audio/x-pn-realaudio", @"ra");
    sub_100191B28(@"audio/x-pn-realaudio", @"rm");
    sub_100191B28(@"audio/x-pn-realaudio", @"ram");
    sub_100191B28(@"audio/x-realaudio", @"ra");
    sub_100191B28(@"audio/x-scpls", @"pls");
    sub_100191B28(@"audio/x-sd2", @"sd2");
    sub_100191B28(@"audio/x-wav", @"wav");
    sub_100191B28(@"image/bmp", @"bmp");
    sub_100191B28(@"image/gif", @"gif");
    sub_100191B28(@"image/ico", @"cur");
    sub_100191B28(@"image/ico", @"ico");
    sub_100191B28(@"image/ief", @"ief");
    sub_100191B28(@"image/jpeg", @"jpeg");
    sub_100191B28(@"image/jpeg", @"jpg");
    sub_100191B28(@"image/jpeg", @"jpe");
    sub_100191B28(@"image/pcx", @"pcx");
    sub_100191B28(@"image/png", @"png");
    sub_100191B28(@"image/svg+xml", @"svg");
    sub_100191B28(@"image/svg+xml", @"svgz");
    sub_100191B28(@"image/tiff", @"tiff");
    sub_100191B28(@"image/tiff", @"tif");
    sub_100191B28(@"image/vnd.djvu", @"djvu");
    sub_100191B28(@"image/vnd.djvu", @"djv");
    sub_100191B28(@"image/vnd.wap.wbmp", @"wbmp");
    sub_100191B28(@"image/webp", @"webp");
    sub_100191B28(@"image/x-cmu-raster", @"ras");
    sub_100191B28(@"image/x-coreldraw", @"cdr");
    sub_100191B28(@"image/x-coreldrawpattern", @"pat");
    sub_100191B28(@"image/x-coreldrawtemplate", @"cdt");
    sub_100191B28(@"image/x-corelphotopaint", @"cpt");
    sub_100191B28(@"image/x-icon", @"ico");
    sub_100191B28(@"image/x-jg", @"art");
    sub_100191B28(@"image/x-jng", @"jng");
    sub_100191B28(@"image/x-ms-bmp", @"bmp");
    sub_100191B28(@"image/x-photoshop", @"psd");
    sub_100191B28(@"image/x-portable-anymap", @"pnm");
    sub_100191B28(@"image/x-portable-bitmap", @"pbm");
    sub_100191B28(@"image/x-portable-graymap", @"pgm");
    sub_100191B28(@"image/x-portable-pixmap", @"ppm");
    sub_100191B28(@"image/x-rgb", @"rgb");
    sub_100191B28(@"image/x-xbitmap", @"xbm");
    sub_100191B28(@"image/x-xpixmap", @"xpm");
    sub_100191B28(@"image/x-xwindowdump", @"xwd");
    sub_100191B28(@"model/iges", @"igs");
    sub_100191B28(@"model/iges", @"iges");
    sub_100191B28(@"model/mesh", @"msh");
    sub_100191B28(@"model/mesh", @"mesh");
    sub_100191B28(@"model/mesh", @"silo");
    sub_100191B28(@"text/calendar", @"ics");
    sub_100191B28(@"text/calendar", @"icz");
    sub_100191B28(@"text/comma-separated-values", @"csv");
    sub_100191B28(@"text/css", @"css");
    sub_100191B28(@"text/html", @"htm");
    sub_100191B28(@"text/html", @"html");
    sub_100191B28(@"text/h323", @"323");
    sub_100191B28(@"text/iuls", @"uls");
    sub_100191B28(@"text/mathml", @"mml");
    sub_100191B28(@"text/plain", @"txt");
    sub_100191B28(@"text/plain", @"asc");
    sub_100191B28(@"text/plain", @"text");
    sub_100191B28(@"text/plain", @"diff");
    sub_100191B28(@"text/plain", @"po");
    sub_100191B28(@"text/richtext", @"rtx");
    sub_100191B28(@"text/rtf", @"rtf");
    sub_100191B28(@"text/texmacs", @"ts");
    sub_100191B28(@"text/text", @"phps");
    sub_100191B28(@"text/tab-separated-values", @"tsv");
    sub_100191B28(@"text/xml", @"xml");
    sub_100191B28(@"text/x-bibtex", @"bib");
    sub_100191B28(@"text/x-boo", @"boo");
    sub_100191B28(@"text/x-c++hdr", @"hpp");
    sub_100191B28(@"text/x-c++hdr", @"h++");
    sub_100191B28(@"text/x-c++hdr", @"hxx");
    sub_100191B28(@"text/x-c++hdr", @"hh");
    sub_100191B28(@"text/x-c++src", @"cpp");
    sub_100191B28(@"text/x-c++src", @"c++");
    sub_100191B28(@"text/x-c++src", @"cc");
    sub_100191B28(@"text/x-c++src", @"cxx");
    sub_100191B28(@"text/x-chdr", @"h");
    sub_100191B28(@"text/x-component", @"htc");
    sub_100191B28(@"text/x-csh", @"csh");
    sub_100191B28(@"text/x-csrc", @"c");
    sub_100191B28(@"text/x-dsrc", @"d");
    sub_100191B28(@"text/x-haskell", @"hs");
    sub_100191B28(@"text/x-java", @"java");
    sub_100191B28(@"text/x-literate-haskell", @"lhs");
    sub_100191B28(@"text/x-moc", @"moc");
    sub_100191B28(@"text/x-pascal", @"p");
    sub_100191B28(@"text/x-pascal", @"pas");
    sub_100191B28(@"text/x-pcs-gcd", @"gcd");
    sub_100191B28(@"text/x-setext", @"etx");
    sub_100191B28(@"text/x-tcl", @"tcl");
    sub_100191B28(@"text/x-tex", @"tex");
    sub_100191B28(@"text/x-tex", @"ltx");
    sub_100191B28(@"text/x-tex", @"sty");
    sub_100191B28(@"text/x-tex", @"cls");
    sub_100191B28(@"text/x-vcalendar", @"vcs");
    sub_100191B28(@"text/x-vcard", @"vcf");
    sub_100191B28(@"video/3gpp", @"3gpp");
    sub_100191B28(@"video/3gpp", @"3gp");
    sub_100191B28(@"video/3gpp2", @"3gpp2");
    sub_100191B28(@"video/3gpp2", @"3g2");
    sub_100191B28(@"video/avi", @"avi");
    sub_100191B28(@"video/dl", @"dl");
    sub_100191B28(@"video/dv", @"dif");
    sub_100191B28(@"video/dv", @"dv");
    sub_100191B28(@"video/fli", @"fli");
    sub_100191B28(@"video/m4v", @"m4v");
    sub_100191B28(@"video/mp2ts", @"ts");
    sub_100191B28(@"video/mpeg", @"mpeg");
    sub_100191B28(@"video/mpeg", @"mpg");
    sub_100191B28(@"video/mpeg", @"mpe");
    sub_100191B28(@"video/mp4", @"mp4");
    sub_100191B28(@"video/mpeg", @"VOB");
    sub_100191B28(@"video/quicktime", @"qt");
    sub_100191B28(@"video/quicktime", @"mov");
    sub_100191B28(@"video/vnd.mpegurl", @"mxu");
    sub_100191B28(@"video/webm", @"webm");
    sub_100191B28(@"video/x-la-asf", @"lsf");
    sub_100191B28(@"video/x-la-asf", @"lsx");
    sub_100191B28(@"video/x-matroska", @"mkv");
    sub_100191B28(@"video/x-mng", @"mng");
    sub_100191B28(@"video/x-ms-asf", @"asf");
    sub_100191B28(@"video/x-ms-asf", @"asx");
    sub_100191B28(@"video/x-ms-wm", @"wm");
    sub_100191B28(@"video/x-ms-wmv", @"wmv");
    sub_100191B28(@"video/x-ms-wmx", @"wmx");
    sub_100191B28(@"video/x-ms-wvx", @"wvx");
    sub_100191B28(@"video/x-sgi-movie", @"movie");
    sub_100191B28(@"video/x-webex", @"wrf");
    sub_100191B28(@"x-conference/x-cooltalk", @"ice");
    sub_100191B28(@"x-epoc/x-sisx-app", @"sisx");
    +[LibcoreNetMimeUtils applyOverrides]_0();
    atomic_store(1u, (unsigned __int8 *)LibcoreNetMimeUtils__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004100F8;
}

+ (JavaIoFileInputStream)getContentTypesPropertiesStream
{
  if ((atomic_load_explicit(LibcoreNetMimeUtils__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id PropertyWithNSString = JavaLangSystem_getPropertyWithNSString_(@"content.types.user.table");
  if (PropertyWithNSString)
  {
    v1 = new_JavaIoFile_initWithNSString_(PropertyWithNSString);
    if ([(JavaIoFile *)v1 exists]) {
      return new_JavaIoFileInputStream_initWithJavaIoFile_(v1);
    }
  }
  v10 = (__CFString *)JavaLangSystem_getPropertyWithNSString_(@"java.home");
  if ((atomic_load_explicit(JavaIoFile__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v11 = (__CFString *)JreStrcat("$$$", v3, v4, v5, v6, v7, v8, v9, @"lib");
  v1 = new_JavaIoFile_initWithNSString_withNSString_(v10, v11);
  if ([(JavaIoFile *)v1 exists]) {
    return new_JavaIoFileInputStream_initWithJavaIoFile_(v1);
  }
  else {
    return 0;
  }
}

+ (JavaIoFileInputStream)applyOverrides
{
  if ((atomic_load_explicit(LibcoreNetMimeUtils__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  result = +[LibcoreNetMimeUtils getContentTypesPropertiesStream]_0();
  if (result)
  {
    v1 = result;
    v2 = new_JavaUtilProperties_init();
    [(JavaUtilProperties *)v2 load__WithJavaIoInputStream:v1];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = [(JavaUtilHashtable *)v2 entrySet];
    uint64_t v4 = v3;
    if (!v3) {
      JreThrowNullPointerException();
    }
    id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (!v8) {
            JreThrowNullPointerException();
          }
          id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) getKey];
          objc_opt_class();
          if (v9 && (objc_opt_isKindOfClass() & 1) == 0) {
            JreThrowClassCastException();
          }
          id v10 = [v8 getValue];
          objc_opt_class();
          if (v10)
          {
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              JreThrowClassCastException();
            }
          }
          sub_100191B28((uint64_t)v10, (uint64_t)v9);
        }
        id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
    return (JavaIoFileInputStream *)[(JavaIoFileInputStream *)v1 close];
  }
  return result;
}

@end